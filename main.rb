#!/usr/bin/env ruby
require_relative './process_input'

class MainEntryPoint
  def initialize
    @processor = UserInputProcessor.new
  end

  def display_menu
    puts 'Select an option: '
    puts
    puts ['1 - List Books', '2 - List Music Albums', '3 - List Games', '4 - List Genres', '5 - List Labels',
          '6 - List Authors', '7 - Add Book', '8 - Add Music Album', '9 - Add Game', '10 - Exit App']
  end

  def open
    puts 'Welcome to Category of My Things!'
    puts

    display_menu
    puts
    user_input = gets.chomp.to_i
    if user_input.positive? && user_input < 11 && user_input != 10
      @processor.process_input(user_input)
    elsif user_input == 10
      exit
    else
      puts 'Wrong input! Enter a number between 1 - 10.'
      main
    end

  end
end

def run_app
  entry_point = MainEntryPoint.new
  entry_point.open
end

run_app
