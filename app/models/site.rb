class Site < ActiveRecord::Base
  require 'csv'
  has_paper_trail
  has_many  :events
  def self.search(search)
    where("hospital_name LIKE ?","%#{search}%")
  end


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      site_hash = row.to_hash # exclude the price field
      site = Site.where(id: site_hash["id"])

      if site.count == 1
        site.first.update_attributes(site_hash.except("access_id")) # exclude the price field.
      else
        Site.create!(site_hash)
      end # end if !product.nil?
    end # end CSV.foreach
  end # end self.import(file)
end
