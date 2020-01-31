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
    Gem.win_platform? ? (system "cls") : (system "clear")
    main_menu
    sender = nil
    input = nil
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
    end
  end
  
 def detailed_view(view_output, input)
   puts "\n*Please choose the corresponding number of a deal to view more details, Or type main or exit*"
   sender = input
   input = nil
   check = nil #checks if we have entered while
   while !( input =='exit'|| input =='main'|| input =='back')
      input = gets.strip.downcase
      i = input.to_i - 1
      if ((i >=0) && (i < view_output.length))
      check = 1
      Gem.win_platform? ? (system "cls") : (system "clear")
      puts <<-DOC.gsub /^\s/,''
           #{view_output[i].title}
           Hotness: #{view_output[i].hotness}
           Price: #{view_output[i].price}
           #{view_output[i].trend_rating} people are talking about this!
           Find it at: #{view_output[i].wheretofind}
      DOC
      elsif input =='main'
              Gem.win_platform? ? (system "cls") : (system "clear")
              get_input
      elsif input == 'exit'
              goodbye_friend
      elsif input !='back'
         puts "invalid input"
      end #end if
    puts "Type main, exit or back" 
    end #end while
    if input =='back'
      Gem.win_platform? ? (system "cls") : (system "clear")
      if check == 1
         input = sender
       else
       get_input
       end
    end
    input
  end
  
  def display_highlights
    menuid = 1
    Gem.win_platform? ? (system "cls") : (system "clear")
    puts"********************HIGHLIGHTS*****************************"
    view_output = @highlights.each.with_index(1) do |d, i| 
         puts "#{i}. #{d.title}"
    end
    outid = detailed_view(view_output,menuid)
    if menuid == outid
      display_highlights
      outid = nil 
    end
    outid
  end 

  def display_hottest
    menuid = 2
    Gem.win_platform? ? (system "cls") : (system "clear")
    puts"********************HOTTEST*****************************"
    hot = @@hottest.sort_by{|h| -h.hotness}
    topten = hot.each.with_index(1) do |d, i| 
        puts "#{i}. #{d.title}" if i < 11
    end
    outid = detailed_view(topten,menuid)
    if menuid == outid
      display_hottest
      outid = nil 
    end
    outid
  end
    
  def display_newest
    menuid = 3
    Gem.win_platform? ? (system "cls") : (system "clear")
    puts"*********************NEWEST*****************************"
    view_output = @newest.each.with_index(1) do |d, i| 
        puts "#{i}. #{d.title}" if i < 11
    end
    outid = detailed_view(view_output,menuid)
    if menuid == outid
      display_newest
      outid = nil 
    end
    outid
  end
  
  def display_trending
    menuid = 4
    Gem.win_platform? ? (system "cls") : (system "clear")
    puts"********************TRENDING*****************************"
    hottest = @highlights.sort_by{|d| -d.trend_rating}
    topten = hottest.each.with_index(1) do |d, i| 
        puts "#{i}. #{d.title}" if i < 11
    end
    outid = detailed_view(topten,menuid)
    if menuid == outid
      display_trending
      outid = nil 
    end
    outid
  end
  
  def goodbye_friend
  Gem.win_platform? ? (system "cls") : (system "clear") #clears commandline
   puts "Thank you for checking out Hot Deals UK. Till next time!"
   HotDealsUk::HOTDEAL.reset_all
   exit!
 end
      
    
end