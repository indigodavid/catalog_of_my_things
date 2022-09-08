require_relative './author'
require 'json'

module AuthorJson
  def load_authors
    data = []
    file = "#{PATH_TO_JSON}authors.json"

    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |author|
        author = JSON.parse(author)
        data << Author.new(
          author['first_name'],
          author['last_name'],
          author['id']
        )
      end
    end
    data
  end
end
