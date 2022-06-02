require_relative '../classes/book'
# require_relative '../classes/items'
require_relative '../classes/label'

describe Label do
  before :each do
    @label = Label.new('new', 'red')
    @book = Book.new('jake', 'candid', 'bad', 'used', '1992-02-02')
    @label.add_item(@book)
  end

  it 'should take an instance of the Item class as an input' do
    expect(@book).to be_an_instance_of Book
  end

  it 'should add the input item to the collection of items"' do
    expect(@label.items.length).to eq(2)
  end

  it 'should add self as a property of the item object' do
    expect(@label.items.length).to eq(2)

    expect(@book.label).to be_an_instance_of Label
  end
end
