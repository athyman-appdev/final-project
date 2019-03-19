# == Schema Information
#
# Table name: roaster_reviews
#
#  id         :integer          not null, primary key
#  body       :string
#  user_id    :integer
#  roaster_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RoasterReview < ApplicationRecord
    
    belongs_to :user
    belongs_to :roaster, :required => false, :foreign_key => "roaster_id"
end
