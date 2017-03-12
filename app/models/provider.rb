class Provider < ActiveRecord::Base
  require 'csv'
  has_many  :events
  has_paper_trail
  #has_paper_trail meta: { timestamp: Time.now }
  #has_paper_trail ignore: [:view_count]
  #has_many  :users
  def self.search(search)
    where("first_name LIKE ?","%#{search}%")
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      provider_hash = row.to_hash # exclude the price field
      provider = Provider.where(id: provider_hash["id"])

      if provider.count == 1
        provider.first.update_attributes(provider_hash.except("access_id")) # exclude the price field.
      else
        Provider.create!(provider_hash)
      end # end if !product.nil?
    end # end CSV.foreach
  end # end self.import(file)
end
