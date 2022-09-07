require_relative '../book'

describe Book do
  context 'should create an instance that' do
    book = Book.new('2009-09-15', 'Random House Planeta', 'good')

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
  end
end
