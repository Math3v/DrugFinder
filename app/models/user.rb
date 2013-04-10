# == Schema Information
#
# Table name: users
#
#  id             :integer          not null, primary key
#  name           :string(20)
#  admin          :boolean
#  remember_token :integer
#

class User < ActiveRecord::Base
  attr_accessible :admin, :id, :name
  before_save :create_remember_token


  private
  
  def create_remember_token
     self.remember_token = SecureRandom.urlsafe_base64
  end
end
