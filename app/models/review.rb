# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :string
#  user_id    :integer
#  beans_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Review < ApplicationRecord
    
    belongs_to :user
    belongs_to :bean, :required => false, :foreign_key => "beans_id"
    
end
