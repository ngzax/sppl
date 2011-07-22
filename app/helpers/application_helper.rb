module ApplicationHelper

  # Class Methods
  def ApplicationHelper.Name
    "The Sausage Party Poker League"
  end

  def ApplicationHelper.ShortName
    "SPPL"
  end

  def ApplicationHelper.Version
    "0"
  end

  def ApplicationHelper.Copyright
    "Copyright 2011 Data-based Design, LLC && JEM, LLC.  All Rights Reserved."
  end

  # Returns the text of the main menu markup (XML).
  def resource_menu
    xml = Builder::XmlMarkup.new
    xml.div(:id => "ResourceMenu") do
      xml << resource_tab_link("seasons", "Seasons")
      xml << resource_tab_link("matches", "Matches")
      xml << resource_tab_link("games",   "Games")
      xml << resource_tab_link("players", "Players")
    end
  end

  def resource_selected?(resource)
    resource == controller.controller_name
  end
  
  def resource_tab_link(resource, label)
    html_opts = (resource_selected?(resource)) ? {"class" => "selected"} : {}
    link_to(label, {:controller => resource, :action => "index"}, html_opts) 
  end
end
