require_relative './book'

module BookLabelModule
  def list_books(books)
    if books.length.zero?
      puts 'No books registered so far.'
    else
      books.each do |book|
        puts "Publish date: #{book.publish_date}, Publisher: #{book.publisher}, Cover state: #{book.cover_state}"
      end
    end
  end

  def list_labels(labels)
    if labels.length.zero?
      puts 'No labels registered so far.'
    else
      labels.each do |label|
        puts "Title: #{label.title}, Color: #{label.color}"
      end
    end
  end

  def add_book
    print 'Publish date: '
    publish_date = gets.chomp

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
    @labels.push(label)
    label.add_item(item)
    save_data(@labels, 'labels')
    p "Now your item has a label: #{label.title}."
  end
end
