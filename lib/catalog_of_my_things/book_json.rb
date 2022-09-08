require_relative './book'
require 'json'

module BooksJson
  def load_books
    data = []
    file = './lib/catalog_of_my_things/books.json'

    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |book|
        book = JSON.parse(book)
        data.push(Book.new(book['publish_date'], book['publisher'], book['cover_state'], book['id'], book['archived']))
      end
    end

    data
  end
end
