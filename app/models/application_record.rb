class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def add_tax_price
        (self.price * 1.10).round
  end

end
