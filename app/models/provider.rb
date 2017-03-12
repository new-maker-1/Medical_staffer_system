class Provider < ActiveRecord::Base
  has_many  :events
  #has_many  :users
  def self.search(search)
    where("first_name LIKE ?","%#{search}%")
  end
end
