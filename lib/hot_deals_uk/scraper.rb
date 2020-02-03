class HotUkDeals::SCRAPER
  
   
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
  
  
