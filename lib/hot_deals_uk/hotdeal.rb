class HotDealsUk::HOTDEAL
  attr_accessor :title, :price, :hotness, :wheretofind
  
  @@hotdeals = []
  @@trending = []
  @@newdeals = []
  @@highlights = []
 
  def self.alldeals
    self.scrape_make_deals
  end
  
 def self.scrape_get_page
    #gets hot deals from appropriate page
    highlights = Nokogiri::HTML(open("https://www.hotukdeals.com"))
    newdeals =  Nokogiri::HTML(open("https://www.hotukdeals.com/new"))
    hotdeals =  Nokogiri::HTML(open("https://www.hotukdeals.com/hot"))
    trending =  Nokogiri::HTML(open("https://www.hotukdeals.com/discussed"))
    [highlights, newdeals, hotdeals, trending]
  end
  
  def self.scrape_get_deals
    #collection of deals
     highlights = self.scrape_get_page[0].search("div.threadGrid")
     newdeals = scrape_get_page[1].search("div.threadGrid")
     hotdeals = self.scrape_get_page{2}.search("div.threadGrid")
     trending  = self.scrape_get_page[3].search("div.threadGrid")
    [highlights, newdeals, hotdeals, trending]
  end
  
  def self.scrape_make_deals
    # makes hotdeal instances
    self.reset_all
    self.scrape_get_deals[0].each_with_index do |d, i|
        deal = HotDealsUk::HOTDEAL.new 
        deal.title = d.css("strong.thread-title a").text.strip
        deal.price = d.css("span.thread-price").text.strip
        deal.hotness = d.css("span.cept-vote-temp.vote-temp.vote-temp--hot").text.strip
        deal.wheretofind = d.css("span.text--b text--color-brandPrimary cept-merchant-name").text.strip
        deal.trend_rating = d.css("cept-comment-link.btn space--h-3.btn--mode-boxSec.cept-comment-link-id-3396545 svg span").text.strip
        @@alldeals << deal
    end
    @@alldeals
 end
  
  def self.reset_all
   @@alldeals.clear
  end
end
  
    