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


  def all_players_by_position
    player_position_hash = {}
    position_string_keys = @teams.map do |team|
      team.players.map do |player|
        player.position
      end
    end.flatten.uniq
    
    position_string_keys.each do |position|
      player_position_hash[position] = active_players_by_position(position)
    end
    player_position_hash
  end
end
