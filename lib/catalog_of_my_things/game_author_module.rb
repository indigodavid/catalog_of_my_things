require_relative './game'
require_relative './author'

module GameAuthorModule
  def list_games
    if @games.length.zero?
      puts 'No games registered so far.'
    else
      print "\n====================================================\n"
      @games.each do |game|
        puts "Title: #{game.title}".colorize(:cyan)
        puts "Publish date: #{game.publish_date}"
        puts "Multiplayer: #{game.multiplayer}"
        puts "Last played at: #{game.last_played_at}"
        puts "====================================================\n"
      end
    end
  end

  def list_authors
    if @authors.length.zero?
      puts 'No authors registered so far.'
    else
      @authors.each do |author|
        puts "Author: #{author.first_name} #{author.last_name}"
      end
    end
  end

  def add_game
    puts 'Insert the title: '.colorize(:yellow)
    title = gets.chomp
    publish_date = validate_date('Publish date (YYYY-MM-DD): ')
    last_played_at = validate_date('When was it last played (YYYY-MM-DD)? ')

    multiplayer = multiplayer_prompt

    game = Game.new(publish_date, multiplayer, last_played_at)
    game.title = title
    new_game = add_additional_data(game)
    @games << new_game unless @games.include?(new_game)
    save_data(@games, 'games')
    puts 'Game added successfully.'.colorize(:light_green)
  end

  def author_prompt(item)
    print 'Please type the author\'s first name: '.colorize(:yellow)
    first_name = gets.chomp
    print 'Please type the author\'s last name: '.colorize(:yellow)
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    item.add_author(author)
    @authors << author unless @authors.include?(author)
    save_data(@authors, 'authors')
    print "Author: #{author.first_name} #{author.first_name} was added successfully.\n\n".colorize(:light_green)
    item
  end

  def multiplayer_prompt
    while true
      print 'Is it multiplayer? Select 1 for Yes, 2 for No: '.colorize(:yellow)
      multiplayer = gets.chomp.to_i

      case multiplayer
      when 1 then multiplayer = 'Yes'
      when 2 then multiplayer = 'No'
      else
        puts 'Wrong option \n\n'.colorize(:red)
        next
      end
      break
    end
    multiplayer
  end
end
