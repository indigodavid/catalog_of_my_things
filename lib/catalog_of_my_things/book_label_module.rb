require_relative './book'
require_relative './label'
require 'date'

module BookLabelModule
  def list_books
    if @books.length.zero?
      puts 'No books registered so far.'
    else
      @books.each do |book|
        puts "Publish date: #{book.publish_date}, Publisher: #{book.publisher}, Cover state: #{book.cover_state}"
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
    publish_date = validate_date('Add publish date (YYYY-MM-DD): ')

    print 'Publisher: '
    publisher = gets.chomp

    while true
      print 'Cover state (select 1 for "good" or 2 for "bad" ): '
      cover_option = gets.chomp.to_i

      case cover_option
      when 1 then cover_state = 'good'
      when 2 then cover_state = 'bad'
      else
        puts "Wrong option \n\n"
        next
      end
      break
    end

    book = Book.new(publish_date, publisher, cover_state)
    new_book = add_additional_data(book)
    @books.push(new_book) unless @books.include?(new_book)
    save_data(@books, 'books')
    puts 'Book added successfully.'
  end

  def label_prompt(item)
    print 'Title (type of article): '
    title = gets.chomp

    print 'Color: '
    color = gets.chomp

    label = Label.new(title, color)
    label.add_item(item)
    @labels.push(label) unless @labels.include?(label)  
    save_data(@labels, 'labels')
    puts "Now your item has a label: #{label.title}."
    item
  end
end
