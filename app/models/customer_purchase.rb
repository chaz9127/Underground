class CustomerPurchase < ApplicationRecord
  belongs_to :customer
  belongs_to :ticket

  validates :customer, :ticket, presence: true

  def serialized 
    {
      id: id,
      customer: customer.serialized,
      ticket: ticket.serialized,
      created_at: created_at,
      updated_at: updated_at
    }
  end
end
