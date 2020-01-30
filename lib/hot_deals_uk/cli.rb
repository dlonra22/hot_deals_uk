class HotDealsUk::CLI
  def call
   get_deals
   get_input
   goodbye_friend
  end
 
  def get_deals
    @highlights = HotDealsUk::HOTDEAL.alldeals
  end
  
  def main_menu
    puts "***Welcome to HOT DEALS UK. Find the hottest, newest and trending deals across the UK!***"
    puts "Please select from the options below "
    puts "1. Highlights"
    puts "2. Hottest Deals"
    puts "3. Newest Deals"
    puts "4. Trending Deals"
  end
  
  def get_input
    input = nil
    sender = nil
    main_menu
    puts "Please enter number of option or type 'exit':"
    while input != "exit"
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
      when "main"
       main_menu
      when "exit"
        goodbye_friend
      else
       puts "*Not a valid option!, enter number or type main or exit*"
      end
     sender = detailed_view(input) 
    end
  end
  
  def display_highlights
    #lists hot deals unorder list
    Gem.win_platform? ? (system "cls") : (system "clear")
    puts"********************HIGHLIGHTS*****************************"
    @highlights.each.with_index(1) do |d, i| 
         puts "#{i}. #{d.title}"
    end
  end 
  
 def detailed_view(input)
   puts "\n*Please choose the corresponding number of a deal to view more details, Or type main or exit*"
   sender = input
   input = nil
   check = nil #checks if we have entered while
   while !( input =='exit'|| input =='main'|| input =='back')
   check = 1
      input = gets.strip.downcase
      if input.to_i > 0 
        i = input.to_i - 1
      Gem.win_platform? ? (system "cls") : (system "clear")
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
              Gem.win_platform? ? (system "cls") : (system "clear")
              get_input
        elsif input == 'exit'
              goodbye_friend
        elsif input != 'back'
         puts "invalid input"
      end #end if
     puts "Type main, exit or back" 
    end
    if input =='back'
         if check = 1 input = nil 
         input = sender #return to sending method/menu if user types back
         sender = nil
          Gem.win_platform? ? (system "cls") : (system "clear")
    end
    input
  end

  def display_hottest
    #orders the list by hottest and displays the top 10.
    puts"********************HOTTEST*****************************"
    hottest = @highlights.sort_by{|d| d.hotness}.reverse!
    hottest.each.with_index(1) do |d, i| 
        puts "#{i}. #{d.title}" if i < 11
    end
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