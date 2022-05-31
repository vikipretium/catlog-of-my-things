require 'date'

class Item
  attr_accessor :published_date, :author
  attr_reader :id, :genre, :label

  def initialize(publish_date)
    @id = rand(1..1000)
    @published_date = Date.parse(publish_date)
    @archived = false
  end

  def add_genre(genre)
    @genre = genre
    genre.items << self
  end

  def add_author(author)
    self.author = (author)
  end

  def add_label(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def can_be_archived?
    # should return true if published_date is older than 10 years
    @published_date < Date.today - 10_000
  end
end
