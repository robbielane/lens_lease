class RentalItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item
end
