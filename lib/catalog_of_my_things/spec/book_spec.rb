require_relative '../book'
require_relative '../label'

describe Book do
  context 'should create an instance that' do
    book = Book.new('2009-09-15', 'Random House Planeta', 'good')
    label = Label.new('Gift', 'Red')

    it 'returns the publish date of the book: 2009-09-15' do
      expect(book.publish_date.to_s).to eq '2009-09-15'
    end

    it 'returns the publisher of the book: Random House Planeta' do
      expect(book.publisher).to eq 'Random House Planeta'
    end

    it 'returns the cover state of the book: good' do
      expect(book.cover_state).to eq 'good'
    end

    it 'has a method add_item' do
      expect(Book.instance_methods(false).include?(:can_be_archived?)).to eq true
    end

    it 'checks if the book should be archived: true' do
      expect(book.can_be_archived?).to eq true
    end

    it 'has a method to_json' do
      book.add_label(label)
      puts book.to_json
      expect(book.to_json).to be_truthy 
    end
  end
end
