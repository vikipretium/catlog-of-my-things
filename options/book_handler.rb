require_relative '../classes/book'

class BookHandler
    def initialize
      @file_data = nil
      @new_book = nil
      @destructured_array = nil
    end

    def load_file
        file_to_load = File.read('books.json')
        JSON.parse(file_to_load)
      end
    
      def load_file_if_it_exist
        load_file unless File.file?('books.json') == false
      end