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
  end
  
  def get_input
    puts "Enter a number corresponding to the options above"
  end
    
end