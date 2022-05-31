require_relative './items'

class Book < Item
  attr_reader :publisher, :cover_state, :publish_date

  def initialize(author, publisher, cover_state, label, publish_date)
    super(publish_date)
    @author = author
    @publisher = publisher
    @cover_state = cover_state
    @label = label
    @publish_date = publish_date
  end

  def can_be_archived?
    if super || @cover_state == 'bad'
      true
    else
      false
    end
  end
end
