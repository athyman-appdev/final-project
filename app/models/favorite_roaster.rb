# == Schema Information
#
# Table name: favorite_roasters
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  roaster_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FavoriteRoaster < ApplicationRecord
    
    belongs_to :roaster
    belongs_to :user
    
end
