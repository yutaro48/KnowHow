# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  category   :integer          default("knowhow"), not null
#  status     :integer          default("draft"), not null
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
  has_many :bookmarks, dependent: :destroy

  validates :title, presence: true
  validates :title, length: { minimum: 2, maximum: 30 }
  validates :content, presence: true

  enum status: { draft: 0, published: 1 }
  enum category: { knowhow: 0, share: 1, news: 2 }

  scope :search, -> (search_param = nil) {
    return if search_param.blank?
    joins("INNER JOIN action_text_rich_texts ON action_text_rich_texts.record_id = posts.id AND action_text_rich_texts.record_type = 'Post'")
    .where("action_text_rich_texts.body LIKE ? OR posts.title LIKE ? ", "%#{search_param}%", "%#{search_param}%")
  }
end
