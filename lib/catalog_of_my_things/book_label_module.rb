require_relative './book'
require_relative './label'
require 'date'

module BookLabelModule
  def list_books
    if @books.length.zero?
      puts 'No books registered so far.'
    else
      print "\n====================================================\n"
      @books.each do |book|
        puts "Title: #{book.title}".colorize(:cyan)
        puts "Publish date: #{book.publish_date}"
        puts "Publisher: #{book.publisher}"
        puts "Cover state: #{book.cover_state}"
        puts "====================================================\n"
      end
    end
  end

  def list_labels
    if @labels.length.zero?
      puts 'No labels registered so far.'
    else
      @labels.each do |label|
        puts "Title: #{label.title}, Color: #{label.color}"
      end
    end
  end

  def add_book
    print 'Insert the title: '.colorize(:yellow)
    title = gets.chomp

    publish_date = validate_date('Add publish date (YYYY-MM-DD): ')

    print 'Publisher: '.colorize(:yellow)
    publisher = gets.chomp

    cover_state = cover_state_prompt

    book = Book.new(publish_date, publisher, cover_state)
    book.title = title
    new_book = add_additional_data(book)
    @books.push(new_book) unless @books.include?(new_book)
    save_data(@books, 'books')
    puts 'Book added successfully.'.colorize(:light_green)
  end

  def label_prompt(item)
    print 'Title (type of article): '.colorize(:yellow)
    title = gets.chomp

    print 'Color: '.colorize(:yellow)
    color = gets.chomp

    label = Label.new(title, color)
    label.add_item(item)
    @labels.push(label) unless @labels.include?(label)
    save_data(@labels, 'labels')
    puts "Now your item has a label: #{label.title}.".colorize(:light_green)
    item
  end

  def cover_state_prompt
    while true
      print 'Cover state (select 1 for "good" or 2 for "bad" ): '.colorize(:yellow)
      cover_option = gets.chomp.to_i

      case cover_option
      when 1 then cover_state = 'good'
      when 2 then cover_state = 'bad'
      else
        puts "Wrong option \n\n".colorize(:red)
        next
      end
      break
    end
    cover_state
  end
end
