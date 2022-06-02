require './classes/game'

describe Game do
  before :each do
    @game = Game.new(true, '2022', '2015-01-10')
  end

  it 'should detect the game publish_date to be 2015' do
    expect(@game.publish_date.to_i).to eq 2015
  end

  it 'should detect the game last played date to be 2022' do
    expect(@game.last_played_at).to eq '2022'
  end

  context 'Testing can_be_archived?' do
    it 'should return false' do
      @game.last_played_at = 2021
      expect(@game.send(:can_be_archived?)).to be false
    end
  end
end
