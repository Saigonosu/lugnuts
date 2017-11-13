class Customer < ApplicationRecord
  self.primary_key = "customerNumber"
  belongs_to :user
  before_save :populate_customer_name

  private

  def populate_customer_name
    self.customerName ||= "#{self.contactFirstName} #{self.contactLastName}"
  end
end
