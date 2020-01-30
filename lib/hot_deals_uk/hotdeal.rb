class HotDealsUk::HOTDEAL
  attr_accessor :title, :price, :discount, :hotness, :age, :expired, :trend_rating, :wheretofind
  
  @@alldeals = []
  
  def initialize
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.reset_all
    @@all.clear
  end
end
  def self.alldeals
  end
  

  
  def self.scrape_get_page
    #gets hot deals from appropriate page
    html = open("https://www.hotukdeals.com/hot")
    doc = Nokogiri::HTML(html)
  end
  
  def self.scrape_get_deals
    #collection of deals
     deals = self.scrape_get_page.search("div.threadGrid")
     deals
  end
  
  def self.scrape_make_deals
    # makes hotdeal instances
    self.scrape_get_deals.each_with_index do |d, i|
        deal = HotDealsUk::HOTDEAL.new
        deal.title = d.css("strong.thread-title a").text #.cept-tt.thread-link.linkPlain.thread-title--list
        puts "#{i}.#{deal.title}"
    end
    binding.pry
  end
end
  
    