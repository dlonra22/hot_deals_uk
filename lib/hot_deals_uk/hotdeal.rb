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

  
 def self.scrape_get_page
    #gets hot deals from appropriate page
    highlights = Nokogiri::HTML(open("https://www.hotukdeals.com"))
    newest =  Nokogiri::HTML(open("https://www.hotukdeals.com/new"))
    hotdeals =  Nokogiri::HTML(open("https://www.hotukdeals.com/hot"))
    trending =  Nokogiri::HTML(open("https://www.hotukdeals.com/discussed"))
    [highlights, newest, hotdeals, trending]
  end
  
  def self.scrape_get_deals
    #collection of deals
     highlights = self.scrape_get_page[0].search("div.threadGrid")
     newest = self.scrape_get_page[1].search("div.threadGrid")
     hotdeals = self.scrape_get_page[2].search("div.threadGrid")
     trending  = self.scrape_get_page[3].search("div.threadGrid")
    [highlights, newest, hotdeals, trending]
  end
  
  def self.make_deals(d)
        deal = HotDealsUk::HOTDEAL.new 
        deal.title = d.css("strong.thread-title a").text.strip
        deal.price = d.css("span.thread-price").text.strip
        deal.hotness = d.css("span.cept-vote-temp.vote-temp.vote-temp--hot").text.strip
        deal.wheretofind = d.css("span.text--b.text--color-brandPrimary.cept-merchant-name").text.strip
        deal.trend_rating = d.css("span.footerMeta-actionSlot a.cept-comment-link btn space--h-3 btn--mode-boxSec span").text
        deal
  end
  
  def self.scrape_make_highlights
    self.scrape_get_deals[0].each do |d, i|
      @@highlights << self.make_deals(d)
    end
    @@highlights
  end
  
  def self.scrape_make_newest
    self.scrape_get_deals[1].each do |d, i|
        @@newest << self.make_deals(d)
    end
    @@newest
  end
  
  def self.scrape_make_hottest
    self.scrape_get_deals[2].each_with_index do |d, i|
         @@hottest << self.make_deals(d)
    end
    @@hottest
  end
    
  def self.scrape_make_trending
    self.scrape_get_deals[3].each_with_index do |d, i|
      @@trending <<  self.make_deals(d)
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
  
    