# == Schema Information
#
# Table name: holders
#
#  id         :integer          not null, primary key
#  name       :string(400)
#  name_clean :string(400)
#

class Holder < ActiveRecord::Base
  attr_accessible :id, :name
  has_many :drugs

  def self.find_holders_like_name name
      Holder.where(["name_clean ILIKE ?", "#{name}%"])
  end

def self.find_by_holder_id id
  Drug.where("holder_id = ?", "#{id}")
end

end
