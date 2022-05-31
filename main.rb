#!/usr/bin/env ruby
require_relative './app'

def main
  puts "\nWelcome to School Library App!\n"
  app = App.new
  loop do
    app.display_menu
    app.run
  end
end

def run_app
  main
end

run_app
