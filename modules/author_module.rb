require_relative '../classes/author'
require 'json'

module AuthorsDataController
  def load_authors
    file = 'authors.json'
    data = []
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |element|
        data.push(Author.new(element['first_name'], element['last_name']))
      end
    end
    data
  end

  def save_authors
    data = []
    @authors.each do |author|
      data.push({ first_name: author.first_name, last_name: author.last_name })
    end
    File.write('authors.json', JSON.generate(data))
  end
end
