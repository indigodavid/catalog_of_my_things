#!/usr/bin/env ruby
require_relative './app'
require 'colorize'

def welcome_prompt
  print "====================================================\n"
  print "                                                    \n"
  print "               Catalog of my Things                 \n".colorize(:light_blue)
  print "                                                    \n"
  print "====================================================\n"
  print "\n\n"
  print "Catalog your items by using our app features\n"
end

def goodbye_prompt
  print "\nThank you for using our App! Good bye!"
  print "\n\n"
  print "Developed by:\n\n".colorize(:cyan)
  print "Oyelakin Ridwan - Nigeria\n"
  print "Jesus Vazquez - Mexico\n"
  print "David Vera - Ecuador\n"
end

def display_options
  puts '1) List all books'
  puts '2) List all music albums'
  puts '3) List of games'
  puts '4) List all genres'
  puts '5) List all labels'
  puts '6) List all authors'
  puts '7) Add a book'
  puts '8) Add a music album'
  puts '9) Add a game'
  puts '10) Quit'
  print 'Please choose an option to continue: '.colorize(:yellow)
end

def main
  app = App.new
  loop do
    welcome_prompt
    display_options
    option = gets.chomp.to_i
    if option > 10 && option < 1
      print 'Invalid option. Press Enter to retry... '
      gets.chomp
      system('clear')
      next
    elsif option == 10
      goodbye_prompt
      break
    else
      app.run(option)
    end
  end
end

main
