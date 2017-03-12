class Site < ActiveRecord::Base
  attr_accessor :hospital_name
  has_many  :shifts
end
