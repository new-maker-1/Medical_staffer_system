class Site < ActiveRecord::Base
  has_many  :events
  def self.search(search)
    where("hospital_name LIKE ?","%#{search}%")
  end
end
