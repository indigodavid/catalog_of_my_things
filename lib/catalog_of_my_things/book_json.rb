require_relative './book'
require 'json'

module BooksJson
  def save_books(books)
    data = books.map do |book|
      {
        id: book.id,
        publish_date: book.publish_date,
        publisher: book.publisher,
        cover_state: book.cover_state,
        archived: book.archived
      }
    end

    File.write('./lib/catalog_of_my_things/books.json', JSON.pretty_generate(data))
  end

  def retrieve_books
    data = []
    file = './lib/catalog_of_my_things/books.json'

    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |book|
        data.push(Book.new(book['publish_date'], book['publisher'], book['cover_state'], book['id'], book['archived']))
      end
    end

    data
  end
end
