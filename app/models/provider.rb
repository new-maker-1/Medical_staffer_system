class Provider < ActiveRecord::Base
  #has_paper_trail
  has_many  :shifts
end
