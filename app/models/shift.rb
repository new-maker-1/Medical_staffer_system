class Shift < ApplicationRecord
  belongs_to :provider
  belongs_to :site
  #validates_presence_of :shift
  #validates_numericality_of :custom_pay_rate, :message=>"Error Message"
  #validates_numericality_of :custom_bill_rate, :message=>"Error Message"
end
