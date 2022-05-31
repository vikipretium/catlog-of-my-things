#!/usr/bin/env ruby
# require_relative './process_input'

class MainEntryPoint
  def initialize
    @processor = UserInputProcessor.new
  end

  def exit_program
    puts 'Thank you for using this app!'
    exit
  end

  def display_menu
    puts 'Select an option: '
    puts
    puts ['1 - List Books', '2 - List Music Albums', '3 - List Games', '4 - List Genres', '5 - List Labels',
          '6 - List Authors', '7 - Add Book', '8 - Add Music Album', '9 - Add Game', '10 - Exit App']
  end

  def choose_action(app)
    decision = gets.chomp
    puts 'please choose of the list' unless '123456789'.include?(decision)
    decision == '10' && exit_program
    methods = [
      method(:list_all_books), method(:list_all_music_albums), method(:list_all_games),
      method(:list_all_genres), method(:list_all_labels), method(:list_all_authors),
      method(:add_book), method(:add_music_album), method(:add_game)
    ]
    '123456789'.include?(decision) && methods[decision.to_i - 1].call(app)
  end
end

def main
  puts "\nWelcome to School Library App!\n"
  app = App.new
  loop do
    display_menu
    choose_action(app)
  end
end

def run_app
  entry_point = MainEntryPoint.new
  entry_point.send(:main)
end

run_app
