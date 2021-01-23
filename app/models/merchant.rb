class Merchant < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :invoices, dependent: :destroy

  def self.search_all(attribute, value)
    if attribute == 'created_at' || attribute == 'updated_at'
      Merchant.where("#{attribute} = '%#{value.to_date}%'")
    else
      Merchant.where("LOWER(#{attribute}) LIKE LOWER('%#{value}%')")
    end
  end

  def self.search(attribute, value)
    if attribute == 'created_at' || attribute == 'updated_at'
      Merchant.find_by("#{attribute} = '%#{value.to_date}%'")
    else
      Merchant.find_by("LOWER(#{attribute}) LIKE LOWER('%#{value}%')")
    end
  end
end
