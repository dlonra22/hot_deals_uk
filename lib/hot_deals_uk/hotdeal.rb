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
    #collection of deals
     deals = self.scrape_get_page.search("div.threadGrid")
     deals
  end
  
  def self.scrape_make_deals
    # makes hotdeal instances
    deals = self.scrape_get_deals.collect do |d|
        deal = HotDealsUk::HOTDEAL.new
        deal.title = d.css("strong.thread-title a.cept-tt.thread-link.linkPlain.thread-title--list").attribute("title").value
        puts "#{deal.title}"
    end
    binding.pry
  end
end
  
    