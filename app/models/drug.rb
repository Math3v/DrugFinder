# == Schema Information
#
# Table name: drugs
#
#  id            :integer          not null, primary key
#  name          :string(200)
#  code          :string(200)
#  sukl_name_old :string(200)
#  label         :string(6000)
#  usage         :string(3500)
#  admin         :boolean
#  producer_id   :integer
#  holder_id     :integer
#  supplier_id   :integer
#  form          :string(200)
#  sukl_name     :string(400)
#

class Drug < ActiveRecord::Base
  attr_accessible :code, :form, :holder_id, :id, :label, :name, :sukl_name, :supplier_id, :usage
  belongs_to :supplier
  belongs_to :producer
  belongs_to :holder

  scope :recent_u, order("updated_at desc").limit(3) # In controller use: Drug.recent_u to see recent updated drugs
  scope :recent_c, order("created_at desc").limit(3) # In controller use: Drug.recent_a to see recent created drugs

def self.find_drugs_like_name name
  Drug.where(["name ILIKE ?","#{name}%"])
end

end
