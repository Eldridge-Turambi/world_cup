class WorldCup
  attr_reader :year,
              :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    teams_in_tournament = @teams.find_all do |team|
      team.eliminated == false
    end

    teams_in_tournament.map do |team|
      team.players.find_all do |player|
        player.position == position
      end
    end.flatten
  end
end
