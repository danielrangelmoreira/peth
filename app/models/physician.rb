# == Schema Information
#
# Table name: physicians
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Physician < ActiveRecord::Base
  attr_accessible :email, :name
  
end
