require_relative './app'

class UserInputProcessor
  def initialize
    @app = App.new
    # @app.load_files_if_exists
  end

  def exit_app
    puts 'Good Bye!'
    exit
  end

  def process_input(user_input)
    check_option(user_input)
  end
end
