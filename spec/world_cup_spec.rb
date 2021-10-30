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
  end

  it 'exists' do
    expect(@world_cup).to be_an_instance_of(WorldCup)
  end
end
