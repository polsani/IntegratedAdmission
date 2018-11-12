class PaymentWay < ApplicationRecord
  has_many :invoices
  has_many :registrations
end
