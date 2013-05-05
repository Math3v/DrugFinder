# == Schema Information
#
# Table name: clicks
#
#  name         :string(200)
#  drug_id      :integer
#  no_of_clicks :integer
#

class Click < ActiveRecord::Base
  # To change this template use File | Settings | File Templates.
  attr_accessible :name, :id, :no_of_clicks
  belongs_to :drug


  def self.find_and_incr_by_id drug_id
    sql = "UPDATE clicks SET no_of_clicks = no_of_clicks + 1 WHERE drug_id = #{drug_id}"
    ActiveRecord::Base.connection.execute(sql)
  end

end
