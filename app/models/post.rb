# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
class Post < ApplicationRecord
  has_rich_text :content
  
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :title, length: { minimum: 2, maximum: 30 }
  validates :content, presence: true
end
