class Player < ActiveRecord::Base

  has_many :results, dependent: :restrict_with_error
  has_many :games, through: :results

  scope :active, ->{where("1 = 1")}

  def <=>(another_player)
    self.total_points <=> another_player.total_points
  end

  def self.sorted_by_first_name
    order('first_name, last_name')
  end

  def full_name
    return "#{self.first_name} #{self.last_name}"
  end

  def non_scoring_results(season_id)
    self.season_results(season_id) - self.scoring_results(season_id)
  end

  def scoring_results(season_id)
    ary = self.season_results(season_id).sort {|x, y| y.points <=> x.points}
    ary[0..5]
  end

  def season_games(season_id)
    Game.joins(:players, :match => :season).where('seasons.id = ? AND players.id = ?', season_id, self.id)
  end

  def season_results(season_id)
    Result.joins(:player, :game => [:match => :season]).where('seasons.id = ? AND players.id = ?', season_id, self.id)
  end

  def season_total_points(season_id)
    sql = %Q(
      WITH scoring_results AS (
        SELECT
          ROUND(CAST(10 * (SQRT(game_results.player_count) / SQRT(results.place)) * (1 + LOG10(10 + 0.25)) AS numeric), 2) AS points
        FROM
          results
        INNER JOIN "players" ON "players"."id" = "results"."player_id"
        INNER JOIN "games" ON "games"."id" = "results"."game_id"
        INNER JOIN "matches" ON "matches"."id" = "games"."match_id"
        INNER JOIN "seasons" ON "seasons"."id" = "matches"."season_id"
        INNER JOIN (SELECT game_id, COUNT(player_id) AS player_count FROM results GROUP BY game_id) AS game_results ON game_results.game_id = games.id
        WHERE
          (seasons.id = #{season_id} AND players.id = #{self.id})
        ORDER BY
          points DESC
        LIMIT 6
      )
      SELECT SUM(points) AS total_points FROM scoring_results;
    )

    result = ActiveRecord::Base.connection.execute(sql)
    result.first['total_points'].to_f
  end

  def to_s
    full_name
  end

  def total_points
    self.season_total_points(Season.last.id)
  end

end
