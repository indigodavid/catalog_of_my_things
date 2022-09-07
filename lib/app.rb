class App
  def initialize
    @books = load_books
    @music_albums = load_music_albums
    @games = load_games
    @authors = load_authors
    @genres = load_genres
    @labels = load_labels
  end

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

  def add_addtional_data(item)
    option = 0
    loop do
      puts 'Please choose one of the options to add to the current item: '
      puts '1) Add author'
      puts '2) Add genre'
      puts '3) Add label'
      puts '4) Keep as is'
      print 'Option: '
      option = gets.chomp.to_i
      case option
      when 1 then author_prompt(item)
      when 2 then genre_prompt(item)
      when 3 then label_prompt(item)
      when 4 then break
      else
        puts 'Invalid option try again.'
      end
    end
  end

  def save_data(data_array, data_name)
    data = data_array.map do |item|
      item.to_json
    end

    File.write("./lib/catalog_of_my_things/#{data_name}.json", JSON.pretty_generate(data))
  end
end
