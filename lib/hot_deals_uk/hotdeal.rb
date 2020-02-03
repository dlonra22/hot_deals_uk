class HotDealsUk::HOTDEAL
  attr_accessor :title, :price, :hotness, :wheretofind, :trend_rating
  
  @@hottest = []
  @@trending = []
  @@newest = []
  @@highlights = []
 
  def self.allhot
    self.scrape_make_hottest
  end
  
  def self.alltrending
    self.scrape_make_trending
  end
 def self.allhighlights
    self.scrape_make_highlights
 end
 def self.allnew
    self.scrape_make_newest
 end

  def self.scrape_make_highlights
    self.scrape_get_deals[0].each do |d, i|
      @@highlights << HotDealUk::SCRAPER.make_deals(d)
    end
    @@highlights
  end
  
  def self.scrape_make_newest
    self.scrape_get_deals[1].each do |d, i|
        @@newest << HotDealUk::SCRAPER.make_deals(d)
    @@newest
  end
  
  def self.scrape_make_hottest
    self.scrape_get_deals[2].each_with_index do |d, i|
         @@hottest << HotDealUk::SCRAPER.make_deals(d)
    end
    @@hottest
  end
    
  def self.scrape_make_trending
    self.scrape_get_deals[3].each_with_index do |d, i|
      @@trending <<  HotDealUk::SCRAPER.make_deals(d)
    end
    @@trending
 end


  def self.reset_all
   @@trending.clear
   @@hottest.clear
   @@newest.clear
   @@highlights.clear
  end
end
  
    