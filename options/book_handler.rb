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

    def create_file
       new_file = File.new('books.json', 'w')
       new_file.puts(JSON.pretty_generate([]))
       new_file.close
    end

    def read_file_if_it_exists
        create_file unless File.file?('books.json')
        @file_data = File.read('books.json')
    end

    def append_to_array
        @destructured_array = JSON.parse(@file_data)
    
        @destructured_array << { 'author' => @new_book.author, 'publisher' => @new_book.publisher,
                                 'cover_state' => @new_book.cover_state, 'label' => @new_book.label, 'publish_date' => @new_book.publish_date }
    end

    def preserve_data
        read_file_if_it_exists
        append_to_array
    
        File.open('books.json', 'w') do |f|
          f.puts JSON.pretty_generate(@destructured_array)
        end
    end