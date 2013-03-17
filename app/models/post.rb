# == Schema Information
#
# Table name: posts
#
#  id             :integer          not null, primary key
#  appointment_id :integer
#  content        :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Post < ActiveRecord::Base
  attr_accessible :appointment_id, :content
  belongs_to :appointment
end
