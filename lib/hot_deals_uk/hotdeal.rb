class HotDealsUk::HOTDEAL
  attr_accessor :title, :price, :discount, :hotness, :age, :expired, :trend_rating, :wheretofind
  
  @@alldeals = []
  def self.alldeals
    #returns a bunch of deals scraped from hotukdeals.com
    self.deal_collection
  end
  
  def deal_collection
    #collects all hot deals from hot deals website highlights
   # @@alldeals << hot_deal_scraper
   # @@alldeals << deal1 = self.new()
   # @@alldeals << deal2 = self.new()
   # @@alldeals
  end
  
  def scrape_get_page
    html = open("https://www.hotukdeals.com/")
    doc = Nokogiri::HTML(html)
    binding.pry
  end
  
  def scrape_get_deals
    scrape_get_page.css(".tGrid-cell")
  end
  
  def scrape_make_deals
    
  end
end
    