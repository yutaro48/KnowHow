# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { minimum: 2, maximum: 30 }
  validates :content, presence: true
end
