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

require 'spec_helper'

describe Drug do
  pending "add some examples to (or delete) #{__FILE__}"
end
