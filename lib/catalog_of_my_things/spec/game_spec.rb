require_relative '../game'
require_relative '../author'

describe Game do
  context 'When Game class is created' do
    before :each do
      @game = Game.new('2017-05-06', 'Yes', '2021-06-20')
      @author = Author.new('Stephen', 'King')
    end

    it 'Game is not null' do
      expect(@game).to be_truthy
    end

    it 'Game publish date should be 2017-05-06' do
      expect(@game.publish_date.to_s).to eql('2017-05-06')
    end

    it 'Game last played at date should be 2021-06-20' do
      expect(@game.last_played_at.to_s).to eql('2021-06-20')
    end

    it 'Game multiplayer should be Yes' do
      expect(@game.multiplayer).to eql('Yes')
    end

    it 'Game can be archived' do
      expect(@game.can_be_archived?).to be false
    end

    it 'Game to_json returns a JSON object' do
      @game.add_author(@author)
      expect(JSON.parse(@game.to_json)).to be_instance_of Hash
    end
  end
end
