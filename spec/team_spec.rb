require './lib/team'
require './lib/player'

RSpec.describe Team do
  before :each do
    @team = Team.new("France")
  end

  it 'exists' do
    expect(@team).to be_an_instance_of(Team)
  end

  it 'has attributes' do
    expect(@team.country).to eq('France')
    expect(@team.eliminated?).to eq(false)

    @team.eliminated = true
    expect(@team.eliminated?).to eq(true)
  end

  it 'has empty players by default' do
    expect(@team.players).to eq([])
  end

  it '#add_player' do
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    @team.add_player(mbappe)
    @team.add_player(pogba)

    expect(@team.players).to eq([mbappe, pogba])
  end

  it '#players_by_position' do
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    @team.add_player(mbappe)
    @team.add_player(pogba)

    expect(@team.players_by_position("midfielder")).to eq([pogba])
    expect(@team.players_by_position("defender")).to eq([])
  end
end
