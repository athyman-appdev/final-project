# == Schema Information
#
# Table name: roasters
#
#  id                  :integer          not null, primary key
#  roaster_name        :string
#  roaster_location    :string
#  shipping_options    :string
#  roaster_description :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  image_url           :string
#  website_url         :string
#

class Roaster < ApplicationRecord
    validates :roaster_name, presence: true
    validates :roaster_location, presence: true
    validates :image_url, presence: true
    
    has_many :beans, :dependent => :destroy
    has_many :favorite_roasters
    
end
