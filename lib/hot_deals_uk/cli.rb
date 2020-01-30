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
   sender = nil
    while input != "exit"
    puts "Please enter number of option. Type 'list' to see Main Menu or 'exit':"
    sender.to_i > 0 ? input = sender : input = gets.strip.downcase
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
        goodbye_friend
      else
       puts "Not a valid option!"
      end
     sender = detailed_view(input) 
    end
  end
  
  def display_highlights
    @highlights =[]
    @highlights.clear
    #lists hot deals unorder list
    Gem.win_platform? ? (system "cls") : (system "clear")
    puts"*******HIGHLIGHTS*******"
    @highlights = HotDealsUk::HOTDEAL.alldeals
    @highlights.each.with_index(1) do |d, i| 
         puts "#{i}. #{d.title}"
    end
  end 
  
 def detailed_view(input)
   puts "Please choose the corresponding number of a deal to view more details. Or back, main or exit"
   sender = input
   input = nil
   while !( input =='exit'|| input =='main'|| input =='back')
      input = gets.strip.downcase
      if input.to_i > 0 
        i = input.to_i - 1
      puts <<-DOC.gsub /^\s/,' '
           #{@highlights[i].title}
           Hotness: #{@highlights[i].hotness}
           Price: #{@highlights[i].price}
           Discount: #{@highlights[i].discount}
           Posted: #{@highlights[i].age} ago
           Deal Still Available?: #{@highlights[i].expired}
           #{@highlights[i].trend_rating} people are talking about this!
           Find it at: #{@highlights[i].wheretofind}
         DOC
        elsif input =='main'
              main_menu 
        elsif input == 'exit'
              goodbye_friend
        elsif input != 'back'
         puts "invalid input"
      end #end if
     puts "Type main, exit or back" 
    end
    if input =='back'
         input = sender #return to sending method/menu if user types back
    end
    input
  end

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
  
  def goodbye_friend
  Gem.win_platform? ? (system "cls") : (system "clear")
   puts "Thank you for checking out Hot Deals UK. Till next time!"
   sleep(2)
   HotDealsUk::HOTDEAL.reset_all
   exit!
 end
      
    
end