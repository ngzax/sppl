class ConsolidateUsers < ActiveRecord::Migration
  def up
    OldUser.all.each do |ou|
      User.create!(
        :email              => "#{ou.username}@sppl.com",
        :password           => %Q(#{ou.username == "admin" ? "s4us4g3" : "friday1"}),
        :created_at         => ou.created_at,
        :updated_at         => ou.updated_at,
        :name               => ou.username,
        :role               => %Q(#{ou.username == "admin" ? :admin : :user})
      )
    end
  end

  def down
    User.delete_all("id > 1")
  end
end
