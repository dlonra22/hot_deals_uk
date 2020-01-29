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
   input = nil
    while input != "exit"
    puts "Please enter number of option. Choose List to see options again or exit:"
    input = gets.strip.downcase
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
      else
       puts "Not a valid option!"
      end
    end
    puts "Thank you for checking out Hot Deals UK. Goodbye"    
  end
  
  def display_highlights
  end 

  def display_hottest
  end
    
  def display_newest
  end
  
  def display_trending
  end
      
    
end