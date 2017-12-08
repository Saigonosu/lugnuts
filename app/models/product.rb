class Product < ApplicationRecord
  self.primary_key = "productCode"
  belongs_to :productlines, class_name: 'Productline', foreign_key: 'productLine'
  has_many :orderdetails, foreign_key: 'productCode'
  has_many :orders, through: :orderdetails, class_name: 'Order'
  has_many :line_items
  has_many :reviews

  mount_uploader :image, ImageUploader
  scope :fidgets, -> { where(productLine: 'spinner')}

  def self.search search
    wildcard_search = "% #{search} %"
    #collate clause for case insensitivity when searching
    where("productName like ? or productDescription like ? or productLine like ? collate utf8_general_ci", wildcard_search, wildcard_search, wildcard_search )
  end
end
