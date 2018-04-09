class Ticket < ApplicationRecord
  belongs_to :package
  belongs_to :cart

  def full_price
    unit_price * quantity
  end
end
