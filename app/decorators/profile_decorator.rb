module ProfileDecorator

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