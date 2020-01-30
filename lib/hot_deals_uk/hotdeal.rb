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
    #selects individual deals from page
    deals = self.scrape_get_page.css(".tGrid-cell")
  end
  
  def self.scrape_make_deals
    #makes deals but of a limited number as returns 1000's
    self.scrape_get_deals.each_with_index do |d, i|
      if i<100
        deal = self.new
        deal.title = d.css(class="cept-tt thread-link linkPlain thread-title--list").title
      end
    end
  end
  
end
    