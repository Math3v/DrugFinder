class Click < ActiveRecord::Base
  # To change this template use File | Settings | File Templates.
  attr_accessible :name, :id, :no_of_clicks
  belongs_to :drug


  def self.find_and_incr_by_id drug_id
    #where("drug_id = #{drug_id}").first.update_attribute(:no_of_clicks, 1)
    sql = "UPDATE clicks SET no_of_clicks = no_of_clicks + 1 WHERE drug_id = #{drug_id}"
    ActiveRecord::Base.connection.execute(sql)
  end

end