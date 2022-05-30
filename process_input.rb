class UserInputProcessor
  def initialize
    @app = App.new
    # @app.load_files_if_exists
  end

  def exit_app
    puts 'Good Bye!'
    exit
  end

  def check_option(input)
    case input
    when 1
      @app.list_all_books
    when 2
      @app.list_all_music_albums
    when 3
      @app.list_all_games
    when 4
      @app.list_all_genres
    when 5
      @app.list_all_labels
    when 6
      @app.list_all_authors
    when 7
      @app.add_book
    when 8
      @app.add_music_album
    when 9
      @app.add_game
    when 10
      exit_app
    else
      puts 'Wrong input! Enter a number between 1 - 10.'
    end
  end

  def process_input(user_input)
    check_option(user_input)
  end
end