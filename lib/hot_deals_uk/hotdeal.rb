class HotDealsUk::HOTDEAL
  attr_accessor :title, :price, :hotness, :age, :expired, :trend_rating, :wheretofind
  
  @@alldeals = []
  
  def self.alldeals
    self.scrape_make_deals
  end
  
 def self.scrape_get_page
    #gets hot deals from appropriate page
    html = open("https://www.hotukdeals.com")
    doc = Nokogiri::HTML(html)
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
        deal.age = d.css("span.hide--toW3")
        @@alldeals << deal
    end
    @@alldeals
 end
  
  def self.reset_all
   @@alldeals.clear
  end
end
  
    