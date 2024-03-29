require_relative './options/add_music_album'
require_relative './options/book_handler'
require './classes/game'
require './classes/author'
require './modules/game_module'
require './modules/author_module'
require 'json'

class App
  include GamesDataController
  include AuthorsDataController
  def initialize
    @book_handler = BookHandler.new
    @games = load_games
    @authors = load_authors
  end

  def display_menu
    puts 'Select an option: '
    puts
    puts ['1 - List Books', '2 - List Music Albums', '3 - List Games', '4 - List Genres', '5 - List Labels',
          '6 - List Authors', '7 - Add Book', '8 - Add Music Album', '9 - Add Game', '10 - Exit App']
  end

  def run
    decision = gets.chomp
    puts 'please choose of the list' unless (1..7).include?(decision.to_i)
    actions(decision)
  end

  def add_music_album
    publish_date, on_spotify = music_album_data
    music_album = MusicAlbum.new(publish_date, on_spotify)
    include_genre(music_album)
    convert_to_js(music_album)
    puts 'Music Album created successfully'
  end

  def list_all_music_albums
    File.write('album.json', '[]') unless File.exist? 'album.json'
    albums = JSON.parse(File.read('album.json'))
    if albums.empty?
      puts '----No albums added yet, please add albums----'
    else
      puts '-----------------------------------------'
      albums.each_with_index do |album, index|
        puts "#{index + 1}) ID:#{album['id']}, publish date: #{album['publish_date']},
      on spotify: #{album['on_spotify']}, genre: #{album['genre']}"
      end
      puts '-----------------------------------------'
    end
  end

  def list_all_genres
    File.write('album.json', '[]') unless File.exist? 'album.json'
    albums = JSON.parse(File.read('album.json'))
    if albums.empty?
      puts '----No genres added yet----'
    else
      puts '-----------------------------------------'
      albums.each_with_index do |album, index|
        puts "#{index + 1}) Genre name: #{album['genre']}"
      end
      puts '-----------------------------------------'
    end
  end

  def add_book
    @book_handler.create_new_book
  end

  def list_all_books
    @book_handler.load_books
  end

  def list_all_labels
    @book_handler.list_labels
  end

  def list_all_games
    puts 'There are no games please try to add one !' if @games.count.zero?
    @games.each do |game|
      puts 'Game list:'
      puts "#{game.multiplayer}, Last played at: #{game.last_played_at}, Publish date: #{game.publish_date}"
    end
  end

  def list_all_authors
    puts 'There are no authors please try to add one through adding games !' if @authors.count.zero?
    @authors.each do |author|
      puts 'Authors List:'
      puts "#{author.first_name} #{author.last_name}\n"
    end
  end

  def add_game
    add_author
    multiplayer, last_played_at = game_input
    publish_date = publish_date_input

    @games << Game.new(multiplayer, last_played_at, publish_date)
    save_games
    puts 'Game created successfully'
    puts ''
  end

  def add_author
    first_name, last_name = author_input

    @authors << Author.new(first_name, last_name)
    puts 'Author  created successfully'
    puts ''
  end

  def exit_program
    puts 'Thank you for using this app!'
    exit
  end

  private

  def game_input
    print 'Multiplayer: '
    multiplayer = gets.chomp

    print 'Last_played_at: '
    last_played_at = gets.chomp.to_i

    [multiplayer, last_played_at]
  end

  def publish_date_input
    print 'Publish_date: '
    gets.chomp.to_s
  end

  def author_input
    print 'First name: '
    first_name = gets.chomp

    print 'Last name: '
    last_name = gets.chomp

    [first_name, last_name]
  end

  def actions(decision)
    methods = [
      method(:list_all_books), method(:list_all_music_albums), method(:list_all_games),
      method(:list_all_genres), method(:list_all_labels), method(:list_all_authors),
      method(:add_book), method(:add_music_album), method(:add_game), method(:exit_program)
    ]
    (1..10).include?(decision.to_i) && methods[decision.to_i - 1].call
  end
end
