class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

  # devise :database_authenticatable, :validatable
  # def serialized
  #   {
  #     id: id,
  #     first_name: first_name,
  #     last_name: last_name,
  #     full_name: full_name,
  #     created_at: created_at,
  #     updated_at: updated_at
  #   }
  # end

  # private

  # def full_name
  #   "#{first_name} #{full_name}"
  # end
end
