require_relative './items'

class Game < Item
  attr_accessor :multiplayer, :last_played_at
  attr_reader :id, :publish_date

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @id = Random.rand(1..500)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @publish_date = publish_date
  end

  private

  def can_be_archived?
    current_year = Time.new.year
    seniority = current_year - @last_played_at
    super && seniority > 2
  end
end
