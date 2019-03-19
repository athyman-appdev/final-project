# == Schema Information
#
# Table name: beans
#
#  id                :integer          not null, primary key
#  country_of_origin :string
#  processing_type   :string
#  flavor_profiles   :string
#  price             :float
#  roaster_id        :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  elevation         :string
#  roast_profile     :string
#  harvest_season    :string
#  cultivar          :string
#  acidity           :string
#  image_url         :string
#

class Bean < ApplicationRecord
    
    belongs_to :roaster
    has_many :reviews, :foreign_key => "beans_id", :dependent => :destroy
    has_many :favorite_beans
    
end
