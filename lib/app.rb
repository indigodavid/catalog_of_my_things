require_relative './catalog_of_my_things/game_json'
require_relative './catalog_of_my_things/author_json'
require_relative './catalog_of_my_things/game_author_module'

require_relative './catalog_of_my_things/book_label_module'
require_relative './catalog_of_my_things/label_json'
require_relative './catalog_of_my_things/book_json'

class App
  include GameAuthorModule
  include GameJson
  include AuthorJson

  include BookLabelModule
  include LabelsJson
  include BooksJson

  PATH_TO_JSON = './json/'.freeze
  def initialize
    @authors = load_authors
    @genres = load_genres
    @labels = load_labels
    @books = load_books
    @music_albums = load_music_albums
    @games = load_games
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def run(option)
    case option
    when 1 then list_books
    when 2 then list_music_albums
    when 3 then list_games
    when 4 then list_genres
    when 5 then list_labels
    when 6 then list_authors
    when 7 then add_book
    when 8 then add_music_album
    when 9 then add_game
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  def add_additional_data(item)
    option = 0
    loop do
      puts 'Please choose one of the options to add to the current item: '
      puts '1) Add author'
      puts '2) Add genre'
      puts '3) Add label'
      puts '4) Keep as it is'
      print 'Option: '
      option = gets.chomp.to_i
      case option
      when 1 then item = author_prompt(item)
      when 2 then item = genre_prompt(item)
      when 3 then item = label_prompt(item)
      when 4 then break
      else
        puts 'Invalid option try again.'
      end
    end
    item
  end

  def save_data(data_array, data_name)
    data = data_array.map(&:to_json)

    File.write("#{PATH_TO_JSON}#{data_name}.json", JSON.pretty_generate(data))
  end

  def valid_date?(date)
    date_format = '%Y-%m-%d'
    DateTime.strptime(date, date_format)
    true
  rescue ArgumentError
    false
  end

  def validate_date(message = 'Date (YYYY-MM-DD): ', error_message = 'Invalid date. Try again.')
    date = ''
    until valid_date?(date)
      print message
      date = gets.chomp
      puts error_message unless valid_date?(date)
    end
    date
  end
end
