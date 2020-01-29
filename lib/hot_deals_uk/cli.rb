class HotDealsUk::CLI
  def call
    puts "Welcome to hot deals uk. Find hottest, newest and trending deals across the uk"
    deal_options 
    get_input
    #display_deals
  end
  
  def deal_options
    puts "Please select from the options below "
    puts "1. Highlights"
    puts "2. Hottest Deals"
    puts "3. Newest Deals"
    puts "4. Trending Deals"
  end
  
  def get_input
   input = gets.strip
    while input != "exit"
    case input
      when "1"
        puts "Highlights"
      when "2"
        puts "Hottest"
      when "3" 
        puts "Newest"
      when "4"
        puts "Trending"
      when "list"
        deal_options
      when "exit"
        puts "Exit program"
      else
        "Not a valid option!"
      end
     puts "Choose List to return or exit:"
    end
    puts "Thank you for checking out Hot Deals UK. Goodbye"    
  end
    
end