require_relative '../author'
require_relative '../item'

describe Author do
  context 'When Author class is created' do
    before :each do
      @author = Author.new('Stephen', 'King')
      
    end

    it 'Author is not null' do
      expect(@author).to be_truthy
    end

    it 'Author first name should be Stephen' do
      expect(@author.first_name).to eql('Stephen')
    end

    it 'Author last played at date should be King' do
      expect(@author.last_name).to eql('King')
    end

    it 'Author add_item should increase @items length and be a property of item' do
      item = Item.new('2020-01-01')
      @author.add_item(item)
      expect(@author.items.length).to be 1
      expect(item.author).to eql(@author)
    end
  end
end
