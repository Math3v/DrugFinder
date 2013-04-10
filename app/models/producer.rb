# == Schema Information
#
# Table name: producers
#
#  id         :integer          not null, primary key
#  name       :string(400)
#  name_clean :string(400)
#

class Producer < ActiveRecord::Base
  attr_accessible :id, :name
  has_many :drugs

  def self.find_producers_like_name name
    Producer.where(["name_clean ILIKE ?", "#{name}%"])
  end

  def self.find_by_producer_id id
    Drug.where("producer_id = ?", "#{id}")
  end
end
