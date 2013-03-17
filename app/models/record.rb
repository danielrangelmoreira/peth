# == Schema Information
#
# Table name: records
#
#  id             :integer          not null, primary key
#  appointment_id :integer
#  content        :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Record < ActiveRecord::Base
  attr_accessible :content
  belongs_to :appointment
end
