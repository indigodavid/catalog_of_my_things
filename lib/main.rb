require_relative './app'

def welcome_prompt
  print '====================================================\n'
  print '                                                    \n'
  print '               Catalog of my Things                 \n'
  print '                                                    \n'
  print '====================================================\n'
  print '\n\n'
  print 'Catalog your items by using our app features\n'
end

def goodbye_prompt
  print 'Thank you for using our App! Good bye!'
  print '\n\n'
  print 'Developed by:\n'
  print 'Oyelakin Ridwan - Nigeria\n'
  print 'Jesus Vazquez - Mexico\n'
  print 'David Vera - Ecuador'
end

def main
  app = App.new
  loop do
    welcome_prompt
    display_options
    option = gets.chomp.to_i
    if option > 13 && option < 1
      print 'Invalid option. Press Enter to retry... '
      gets.chomp
      system('clear')
      next
    elsif option == 13
      goodbye_prompt
      break
    else
      app.run(option)
    end
  end
end

main