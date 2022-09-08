require_relative './item'
require_relative './music_album'
require_relative './genre'

module MusicGenreModule
  def list_music_albums
    if @music_albums.length.zero?
      puts 'No music registered so far.'
    else
      print "\n====================================================\n"
      @music_albums.each do |music|
        puts "Title: #{music.title}".colorize(:cyan)
        puts "Publish date: #{music.publish_date}"
        puts "on_spotify: #{music.on_spotify}"
        puts "====================================================\n"
      end
    end
  end

  def list_genres
    if @genres.length.zero?
      puts 'No genre name registered so far.'
    else
      @genres.each do |genre|
        puts "Name: #{genre.name}"
      end
    end
  end

  def add_music_album
    puts 'Insert the title: '.colorize(:yellow)
    title = gets.chomp
    publish_date = validate_date('Publish date (YYYY-MM-DD): ')

    on_spotify = on_spotify_prompt

    music = MusicAlbum.new(publish_date, on_spotify)
    music.title = title
    new_music = add_additional_data(music)
    @music_albums << new_music unless @music_albums.include?(new_music)
    save_data(@music_albums, 'music_albums')
    puts 'Music added successfully.'.colorize(:light_green)
  end

  def genre_prompt(item)
    print 'Please enter the genre\'s name: '.colorize(:yellow)
    name = gets.chomp
    genre = @genres.find { |exist_genre| exist_genre.name == name } || Genre.new(name)
    item.add_genre(genre)
    @genres << genre unless @genres.include?(genre)
    save_data(@genres, 'genres')
    print "Genre: #{genre.name} was added successfully.\n\n".colorize(:light_green)
    item
  end

  def on_spotify_prompt
    while true
      print 'Is it spotify? Select 1 for Yes, 2 for No: '.colorize(:yellow)
      on_spotify = gets.chomp.to_i

      case on_spotify
      when 1 then on_spotify = 'Yes'
      when 2 then on_spotify = 'No'
      else
        puts 'Wrong option \n\n'.colorize(:red)
        next
      end
      break
    end
    on_spotify
  end
end
