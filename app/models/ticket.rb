class Ticket < ApplicationRecord
  belongs_to :event
  has_many :customer_purchases

  validates :price, :name, presence: true
  validate :price_must_be_positive

  def serialized
    {
      id: id,
      price: price,
      name: name,
      display: "#{name} ($#{sprintf('%.2f', price/100)})",
      created_at: created_at,
      updated_at: updated_at
    }
  end

  private

  def price_must_be_positive
    unless price > 0
      errors.add(:base, 'Price must be more than 0 cents')
    end
  end

end
