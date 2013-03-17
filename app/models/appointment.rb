# == Schema Information
#
# Table name: appointments
#
#  id         :integer          not null, primary key
#  patient_id :integer
#  ap_date    :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  local      :string(255)
#  type       :string(255)
#

class Appointment < ActiveRecord::Base
  attr_accessible :ap_date, :local, :kind
  belongs_to :patient
  has_one :record
end
