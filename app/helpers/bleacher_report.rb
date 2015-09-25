helpers do

  def get_bleacher_report_articles(team)
    team_tag = team.full_name.downcase.tr(" ","-")
    BleacherApi::Front.lead_articles(tags: "san-francisco-49ers").to_json
  end

end