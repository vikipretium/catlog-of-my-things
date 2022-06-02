require_relative '../classes/book'

describe Book do
  before :all do
    @book = Book.new('jake', 'candid', 'bad', 'used', '1992-02-02')
  end

  it 'should override the method in the parent class' do
    expect(@book.can_be_archived?).to eq(true)
  end

  it 'should return true if parents method returns true OR if cover_state equals to "bad"' do
    expect(@book.can_be_archived?).to eq(true)
  end

  it 'otherwise, it should return false' do
    @book = Book.new('jake', 'candid', 'good', 'used', '2020-02-02')
    expect(@book.can_be_archived?).to eq(false)
  end
end
