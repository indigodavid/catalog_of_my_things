require_relative './game'
require_relative './author'

module GameAuthorModule
  def list_games(games)
    if games.length.zero?
      puts 'No games registered so far.'
    else
      games.each do |game|
        puts "Publish date: #{game.publish_date}"
        puts "Multiplayer: #{game.multiplayer}" 
        puts "Last played at: #{game.last_played_at}"
      end
    end
  end

  def list_authors(authors)
    if authors.length.zero?
      puts 'No authors registered so far.'
    else
      authors.each do |author|
        puts "Author: #{author.first_name} #{author.last_name}"
      end
    end
  end

  def add_game
    publish_date = validate_date('Publish date (YYYY-MM-DD): ')
    last_played_at = validate_date('When was it last played (YYYY-MM-DD)? ')

    while true
      print 'Is it multiplayer? Select 1 for Yes, 2 for No: '
      multiplayer = gets.chomp.to_i

      case multiplayer
      when 1 then multiplayer = 'Yes'
      when 2 then multiplayer = 'No'
      else
        puts 'Wrong option \n\n'
        next
      end
      break
    end

    game = Game.new(publish_date, multiplayer, last_played_at)
    puts 'Game added successfully.'
    game
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
