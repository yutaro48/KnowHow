# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
  has_rich_text :content

  validates :title, presence: true
  validates :title, length: { minimum: 2, maximum: 30 }
  validates :content, presence: true
end
