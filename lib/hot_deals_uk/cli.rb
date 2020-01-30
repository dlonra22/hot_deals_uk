class HotDealsUk::CLI
  def call
    puts "Welcome to hot deals uk. Find hottest, newest and trending deals across the uk"
   main_menu 
   get_input
    #display_deals
  end
  
  def main_menu
    puts "Please select from the options below "
    puts "1. Highlights"
    puts "2. Hottest Deals"
    puts "3. Newest Deals"
    puts "4. Trending Deals"
  end
  
  def get_input
   input = nil
    while input != "exit"
    puts "Please enter number of option. Type 'list' to see Main Menu or 'exit':"
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
       main_menu
      when "exit"
      else
       puts "Not a valid option!"
      end
    end
    puts "Thank you for checking out Hot Deals UK. Goodbye"    
  end
  
  def display_highlights
    #lists 10 hot deals
    puts"*******HIGHLIGHTS*******"
    @highlihts = HotDealsUk::HOTDEAL.alldeals
    each.with_index(1) do |d, i| 
         puts "#{i}. #{d.title}"
    end
  end 
  
  detailed_view

  def display_hottest
    #orders the list by hottest and displays the top 10.
    puts"hotdeals Hottest instances"
    #hotdeal@deals.collect {|d| d.hottness >= 100}

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