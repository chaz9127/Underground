class Customer < ApplicationRecord
  has_many :customer_purchases

  def serialized
    {
      id: id,
      first_name: first_name,
      last_name: last_name,
      full_name: full_name,
      email: email,
      returning: returning,
      created_at: created_at,
      updated_at: updated_at
    }
  end

  private

  def full_name
    "#{first_name} #{last_name}"
  end
end
