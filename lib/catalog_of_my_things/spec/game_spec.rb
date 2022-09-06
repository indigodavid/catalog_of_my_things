require_relative '../game'

describe Game do
  context 'When Game class is created' do
    before :each do
      @game = Game.new('2017-05-06', 'Yes', '2021-06-20')
    end

    it 'Game is not null' do
      expect(@game).to be_truthy
    end

    it 'Game publish date should be 2017-05-06' do
      expect(@game.publish_date).to eql('2017-05-06')
    end

    it 'Game last played at date should be 2021-06-20' do
      expect(@game.last_played_at).to eql('2021-06-20')
    end

    it 'Game multiplayer should be Yes' do
      expect(@game.multiplayer).to eql('Yes')
    end
  end
end