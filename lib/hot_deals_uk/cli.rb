class HotDealsUk::CLI
  def call
   get_deals
   get_input
   goodbye_friend
  end
 
  def get_deals
    @highlights = HotDealsUk::HOTDEAL.allhighlights
    @hottest = HotDealsUk::HOTDEAL.allhot
    @trenging = HotDealsUk::HOTDEAL.alltrending
    @newest = HotDealsUk::HOTDEAL.allnew
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
    main_menu
    sender = nil
    input = nil
    puts "Please enter number of option or type 'exit':"
    while input != "exit"
    sender.to_i > 0 ? input = sender : input = gets.strip.downcase
    view_output = nil
    case input
      when "1"
      view_output =  display_highlights
      when "2"
        view_output = display_hottest
      when "3" 
        view_output = display_newest
      when "4"
        view_output = display_trending
      when "main"
       main_menu
      when "exit"
        goodbye_friend
      else
       puts "*Not a valid option!, enter number or type main or exit*"
      end
      sender = detailed_view(view_output,input) if view_output != nil
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
  
 def detailed_view(view_output,input)
   puts "\n*Please choose the corresponding number of a deal to view more details, Or type main or exit*"
   sender = input
   input = nil
   check = nil #checks if we have entered while
   while !( input =='exit'|| input =='main'|| input =='back')
   check = 1
      input = gets.strip.downcase
      i = input.to_i - 1
      if ((i >=0) && (i <= view_output.length))
      Gem.win_platform? ? (system "cls") : (system "clear")
      puts <<-DOC.gsub /^\s/,''
           #{view_output[i].title}
           Hotness: #{view_output[i].hotness}
           Price: #{view_output[i].price}
           Posted: #{view_output[i].age} ago
           #{view_output[i].trend_rating} people are talking about this!
           Find it at: #{view_output[i].wheretofind}
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
         input = sender #return to sending method/menu if user types back
         sender = nil
         Gem.win_platform? ? (system "cls") : (system "clear")
         if check == nil #returns to main
           input = nil 
           get_input
           binding.pry
         end
    end
    input
  end

  def display_hottest
    #orders the list by hottest and displays the top 10.
    puts"********************HOTTEST*****************************"
    hottest = @hottest.sort_by{|d| -d.hotness}
    topten = hottest.each.with_index(1) do |d, i| 
        puts "#{i}. #{d.title}" if i < 11
    end
    topten
  end
    
  def display_newest
    puts "********************Newest*****************************"
    @newest.sort_by{|d| -d.hotness}
   @newes.each.with_index(1) do |d, i| 
        puts "#{i}. #{d.title}" if i < 11
    end
    topten
  end
  
  def display_trending
    puts "********************Newest*****************************"
    hottest = @highlights.sort_by{|d| -d.hotness}
    topten = hottest.each.with_index(1) do |d, i| 
        puts "#{i}. #{d.title}" if i < 11
    end
    topten
  end
  
  def goodbye_friend
  Gem.win_platform? ? (system "cls") : (system "clear")
   puts "Thank you for checking out Hot Deals UK. Till next time!"
   sleep(1)
   HotDealsUk::HOTDEAL.reset_all
   exit!
 end
      
    
end