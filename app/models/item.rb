class Item < ActiveRecord::Base
  def ==(other_item)
    self.class == other_item.class &&
    name == other_item.name &&
    unit == other_item.unit &&
    list_id == other_item.list_id
  end
  alias :eql? :==

  belongs_to :list
end
