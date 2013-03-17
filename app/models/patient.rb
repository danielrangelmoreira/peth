# == Schema Information
#
# Table name: patients
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  email       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  address     :string(255)
#  city        :string(255)
#  dob         :date
#  postal_code :integer
#  state       :string(255)
#  rghc        :string(255)
#  phone       :string(255)
#

class Patient < ActiveRecord::Base
	include PgSearch
  VALID_RGHC_REGEX = /\A\d{6}[a-zA-Z]\z/
  attr_accessible :address, :city, :dob, :name, :postal_code, :state, :rghc, :phone, :email
  before_save { |patient| patient.name = name.downcase }
  
  has_many :appointments
  
  validates :name, presence: :true
  validates :rghc, presence:   true,
                    format:     { with: VALID_RGHC_REGEX },
                    uniqueness: { case_sensitive: false }

pg_search_scope :search_by_name, :against => :name, 
                :using => { :tsearch => {:prefix => true }}
  
end
