class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items, dependent: :destroy

  def self.search_all(attribute, value)
    case attribute
    when 'created_at', 'updated_at'
      Item.where("#{attribute} = '%#{value.to_date}%'")
    when 'unit_price'
      Item.where("#{attribute} = '%#{value.to_f}%'")
    else
      Item.where("LOWER(#{attribute}) LIKE LOWER('%#{value}%')")
    end
  end

  def self.search(attribute, value)
    case attribute
    when 'created_at', 'updated_at'
      Item.find_by("#{attribute} = '%#{value.to_date}%'")
    when 'unit_price'
      Item.find_by("#{attribute} = '%#{value.to_f}%'")
    else
      Item.find_by("LOWER(#{attribute}) LIKE LOWER('%#{value}%')")
    end
  end
end
