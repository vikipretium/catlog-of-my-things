require_relative './items'

class MusicAlbum < Item
  attr_reader :on_spotify, :publish_date

  def initialize(publish_date, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
    @publish_date = publish_date
  end

  def can_be_archived?
    if super || @on_spotify == true
      true
    else
      false
    end
  end
end
