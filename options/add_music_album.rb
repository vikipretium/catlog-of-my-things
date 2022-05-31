require 'json'
require_relative '../classes/music_album'
require_relative '../classes/genre'

def music_album_data
  valid = false
  print 'Publish Date: '
  publish_date = gets.chomp
  on_spotify = ''
  until valid
    print 'On Spotify Y/N:'
    on_spotify = gets.chomp.downcase
    valid = %w[y n].include?(on_spotify)
    on_spotify = '' unless valid
    puts 'Please insert y or n as the on spotify' unless valid
  end
  spotify = false
  spotify = true if on_spotify == 'y'
  [publish_date, spotify]
end

def convert_to_js(album)
  File.write('album.json', '[]') unless File.exist?('album.json')
  albums = JSON.parse(File.read('album.json'))
  albums << { 'id' => album.id,
              'publish_date' => album.publish_date, 'on_spotify' => album.on_spotify, 'genre' => album.genre.name }
  File.write('album.json', JSON.generate(albums))
end

def include_genre(album)
  puts 'Name of genre: '
  genre_name = gets.chomp
  genre = Genre.new(genre_name)
  album.add_genre(genre)
end
