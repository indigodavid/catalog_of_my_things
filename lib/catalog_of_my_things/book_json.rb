require_relative './book'
require 'json'

module BooksJson
  def find_label(id)
    @labels.each { |label| return label if label.id == id }
  end

  def find_author(id)
    @authors.each { |author| return author if author.id == id }
  end

  def find_genre(id)
    @genres.each { |genre| return genre if genre.id == id }
  end

  def load_books
    data = []
    file = "#{PATH_TO_JSON}books.json"

    if File.exist?(file) && File.read(file) != ''
      json_array = JSON.parse(File.read(file))
      json_array.each do |book|
        book = JSON.parse(book)
        book_to_obj = Book.new(book['publish_date'], book['publisher'], book['cover_state'], book['id'],
                               archived: book['archived'])

        book_to_obj.add_label(find_label(book['label']['id'])) if book['label']
        book_to_obj.add_author(find_author(book['author']['id'])) if book['author']
        book_to_obj.add_genre(find_genre(book['genre']['id'])) if book['genre']

        data.push(book_to_obj)
      end
    end

    data
  end
end
