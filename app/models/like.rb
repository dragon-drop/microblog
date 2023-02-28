class Like < ApplicationRecord
    belongs_to :user
    belongs_to :post

    validates :user_id, uniqueness: {scope: :post_id}
end
  
# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#  user_id    :integer
#
