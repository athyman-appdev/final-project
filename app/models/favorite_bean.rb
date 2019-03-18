# == Schema Information
#
# Table name: favorite_beans
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  bean_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FavoriteBean < ApplicationRecord
    
    belongs_to :user
    belongs_to :bean
    
end
