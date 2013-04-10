# == Schema Information
#
# Table name: suppliers
#
#  id         :integer          not null, primary key
#  name       :string(400)
#  name_clean :string(400)
#

class Supplier < ActiveRecord::Base
  attr_accessible :id, :name
  has_many :drugs

  def self.find_supplier_like_name name
    Supplier.where(["name_clean ILIKE ?", "#{name}%"])
  end

  def self.find_by_supplier_id id
    Drug.where("supplier_id = ?", "#{id}")
  end
end
