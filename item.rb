require 'date'

class Item
  attr_accessor :genre, :author, :source, :label

  def initialize(published_date)
    @id = Random.id(1..1000)
    @published_date = Date.now(published_date)
    @achieved = false
  end

  def can_be_archived?
    (Time.now.year - @published_date.year) > 10
  end

  def move_to_archive
    @achieved = true if can_be_archived?
  end

end
