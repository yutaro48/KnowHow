# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  birthday   :date
#  email      :string
#  gender     :integer
#  join       :date
#  name       :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
class Profile < ApplicationRecord
  enum gender: { male: 0, female: 1, other: 2 }

  belongs_to :user

  def age
    return '不明' unless birthday.present?
    years = Time.zone.now.year - birthday.year
    days = Time.zone.now.yday - birthday.yday

    if days < 0
      "#{years - 1}歳"
    else
      "#{years}歳"
    end
  end

  def join_age
    return '不明' unless join.present?
    years = Time.zone.now.year - join.year
    days = Time.zone.now.yday - join.yday

    if days < 0
      "#{years}年目"
    else
      "#{years + 1}年目"
    end
  end
end
