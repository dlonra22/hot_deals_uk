class HotDealsUk::CLI
  def call
    puts "Welcome to hot deals uk. Find hottest, newest and trending deals across the uk"
    deal_options 
    get_input
    #display_deals
  end
  
  def deal_options
    puts "Please select from the options below "
    puts "1. Newest Deals"
    puts "2. Hottest Deals"
    puts "3. Trending Deals"
    puts "4. Hot and Trending"
    puts "5. Hot and New"
    puts "6. Newest Trending Deals"
    puts "7. Search Deals"
  end
  
  def get_input
    input = nil
    while input != "exit"
    puts "Enter a number corresponding to the options above or choose exit:"
    input = gets.strip
      case input
      when "1"
        puts "more info on newest deals"
      when "2"
        puts "more info on hottest deals"
      when "3" 
        puts "more info on Trending"
      when "4"
        puts "more info on Hot and Trending"
      when "5"
        puts "more info on hot and new"
      when "6"
        puts "more info on New and Trending"
      when "7"
        puts "Take user to search menu"
      end
    sleep(5)
    deal_options
    end
    puts "Thank you for checking out Hot Deals UK. Goodbye"    
  end
    
end