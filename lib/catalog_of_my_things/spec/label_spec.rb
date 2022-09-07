require_relative '../label'
require_relative '../book'

describe Label do
  context 'should create an instance that' do
    before :each do
      @label_test = Label.new('Gift', 'Red')
      @book_test = Book.new('2009-09-15', 'Random House Planeta', 'good')
    end

    it 'returns the kind of article that it is: Gift' do
      expect(@label_test.title).to eq 'Gift'
    end

    it 'returns the color of the article: Red' do
      expect(@label_test.color).to eq 'Red'
    end

    it 'has a method add_item' do
      expect(Label.instance_methods.include?(:add_item)).to eq true
    end

    it 'adds an item to the items list' do
      @label_test.add_item(@book_test)
      expect(@label_test.items.length).to eq 1
    end

    it 'becomes an attribute in the Item class' do
      @label_test.add_item(@book_test)
      expect(@book_test.label).to eq @label_test
    end
  end
end
