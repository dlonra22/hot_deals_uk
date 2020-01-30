class HotDealsUk::HOTDEAL
  attr_accessor :title, :price, :hotness, :wheretofind
  
  @@alldeals = []
  
  def self.alldeals
    self.scrape_make_deals
  end
  
 def self.scrape_get_page
    #gets hot deals from appropriate page
    highlights = Nokogiri::HTML(open("https://www.hotukdeals.com"))
    newdeals =  Nokogiri::HTML(open("https://www.hotukdeals.com"))
  end
  
  def self.scrape_get_deals
    #collection of deals
     deals = self.scrape_get_page.search("div.threadGrid")
     deals
  end
  
  def self.scrape_make_deals
    # makes hotdeal instances
    self.reset_all
    self.scrape_get_deals.each_with_index do |d, i|
        deal = HotDealsUk::HOTDEAL.new 
        deal.title = d.css("strong.thread-title a").text.strip
        deal.price = d.css("span.thread-price").text.strip
        deal.hotness = d.css("span.cept-vote-temp.vote-temp.vote-temp--hot").text.strip
        deal.age = d.css("span.hide--toW2 metaRibbon lbox--v-1 overflow--wrap-off space--l-3.text--color-greyShade span.hide--toW3").text.strip
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
  
    