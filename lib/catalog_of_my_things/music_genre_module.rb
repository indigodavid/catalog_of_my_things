require_relative './item'
require_relative './music_album'
require_relative './genre'

module MusicGenreModule
  def list_music
    if @musics.length.zero?
      puts 'No music registered so far.'
    else
      @musics.each do |music|
        puts "Publish date: #{music.publish_date}"
        puts "on_spotify: #{music.on_spotify}"
      end
    end
  end

  def list_genre
    if @genres.length.zero?
      puts 'No genre name registered so far.'
    else
      @genres.each do |genre|
        puts "Name: #{genre.name}"
      end
    end
  end

  def add_music_album
    publish_date = validate_date('Publish date (YYYY-MM-DD): ')
    on_spotify = validate_date('Was it Spotified YES or NO? ')

    loop do
      print 'Is it spotify? Select 1 for Yes, 2 for No: '
      on_spotify = gets.chomp.to_i

      case on_spotify
      when 1 then on_spotify = 'Yes'
      when 2 then on_spotify = 'No'
      else
        puts 'Wrong option \n\n'
        next
      end
      break
    end

    music = MusicAlbum.new(publish_date, on_spotify)
    new_music = add_addtional_data(music)
    @musics << new_music unless @games.include?(new_game)
    save_data(@musics, 'musicss')
    puts 'Music added successfully.'
  end

  def genre_prompt(item)
    print 'Please enter the genre\'s name: '
    name = gets.chomp
    genre = Genre.new(name)
    item.add_genre(genre)
    print "Genre: #{genre.name} was added successfully.\n\n"
    item
  end
end
