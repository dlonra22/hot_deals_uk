class HotDealsUk::HOTDEAL
  attr_accessor :title, :price, :discount, :hotness, :age, :expired, :trend_rating, :wheretofind
  
  @@alldeals = []
  def self.alldeals
    #returns a bunch of deals scraped from hotukdeals.com
    self.deal_collection
  end
  
  def deal_collection
    #collects all hot deals from hot deals website/hot
   # @@alldeals << hot_deal_scraper
   # @@alldeals << deal1 = self.new()
   # @@alldeals << deal2 = self.new()
   # @@alldeals
  end
  
  def self.scrape_get_page
    #gets hot deals from appropriate page
    html = open("https://www.hotukdeals.com/hot")
    doc = Nokogiri::HTML(html)
  end
  
  def self.scrape_get_deals
    #selects individual deals from page up to a 100 deals
    i = 1
    deals = []
    While i <101
     deals << self.scrape_get_page.css(".tGrid-cell")
     i+=1
   end
  end
  
  def self.scrape_make_deals
    # makes deals 
    self.scrape_get_deals.each do |d|
        deal = self.new
        deal.title = d.css(".thread-title").attribute("title").value
      end
    end
    binding.pry
  end
  
end
    