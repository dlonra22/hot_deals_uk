class HotDealsUk::HOTDEAL
  attr_reader :title, :price, :discount
  @@alldeals = []
  
  def self.alldeals
    #returns a bunch of deals scraped from hotukdeals.com
    @@alldeals
  end
end