module PostDecorator

  def bookmark_count
    bookmarks.count
  end
    
  def display_created_at
    I18n.l(self.created_at, format: :long)
  end

  def has_published?
    status == 'published'
  end

  def about_knowhow?
    category == "knowhow"
  end
end