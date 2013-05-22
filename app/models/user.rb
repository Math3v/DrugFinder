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
  attr_accessible :admin, :id, :name, :password, :password_confirmation
  before_save :create_remember_token
  has_secure_password

  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end
