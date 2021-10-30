require './lib/world_cup'
require './lib/team'
require './lib/player'

RSpec.describe WorldCup do
  before :each do
    @france = Team.new("France")
    @croatia = Team.new("Croatia")

    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})

    @modric = Player.new({name: "Luka Modric", position: "midfielder"})
    @vida = Player.new({name: "Domagoj Vida", position: "defender"})

    @world_cup = WorldCup.new(2018, [@france, @croatia])

    @france.add_player(@mbappe)
    @france.add_player(@pogba)
    @croatia.add_player(@modric)
    @croatia.add_player(@vida)
  end

  it 'exists' do
    expect(@world_cup).to be_an_instance_of(WorldCup)
  end

  it 'has attributes' do
    expect(@world_cup.year).to eq(2018)
    expect(@world_cup.teams).to eq([@france, @croatia])
  end

  it '#active_players_by_position' do
    expect(@world_cup.active_players_by_position("midfielder")).to eq([@pogba, @modric])

    @croatia.eliminated = true
    expect(@world_cup.active_players_by_position("midfielder")).to eq([@pogba])
  end

  it '#all_players_by_position' do

    expected = {
    "forward" => [@mbappe],
    "midfielder" => [@pogba, @modric],
    "defender" => [@vida]
  }

    expect(@world_cup.all_players_by_position).to eq(expected)
  end
end
