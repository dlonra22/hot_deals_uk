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
        display_highlights
      when "2"
        display_hottest
      when "3" 
        display_newest
      when "4"
        display_trending
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
    #lists the top ten deals listed as per scraped website
    puts"hotdeals instances as hightlights"
    @deals = HotDealsUK::HOTDEAL.alldeals
  end 

  def display_hottest
    #lists the top 10 hottest highlighted deals
    puts"hotdeals Hottest instances"
  end
    
  def display_newest
    #lists the top 10 newest deals
    puts"hotdeals Newest instances"
  end
  
  def display_trending
    #lists the top ten most discussed
    puts "hotdeals trending instances"
  end
      
    
end