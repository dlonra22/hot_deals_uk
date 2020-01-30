class HotDealsUk::HOTDEAL
  attr_accessor :title, :price, :discount, :hotness, :age, :expired, :trend_rating, :wheretofind
  
  @@alldeals = []
  def self.alldeals
    #returns a bunch of deals scraped from hotukdeals.com
    self.deal_collection
  end
  
  def deal_collection

    @@alldeals << deal_scraper
    @@alldeals << deal1 = self.new()
    @@alldeals << deal2 = self.new()
    @@alldeals
  end
  
  def deal_scraper
    doc = open