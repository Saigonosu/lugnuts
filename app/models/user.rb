class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :customer, autosave: true
  has_one :cart, autosave: true
  has_many :shipping_addresses
  has_many :billing_addresses
  has_many :reviews

  accepts_nested_attributes_for :customer, allow_destroy: true

end
