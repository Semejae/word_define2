require('rspec')
require('pry')
require('word')

describe '#word' do 

  # before(:each) do 
  #   Word.clear()
  # end

describe('#inittialize') do
    it('it will recongnize name and id') do 
      words = Word.new
      ("Grant")
    expect(words.name).to(eq("Grant"))
  end 
end

describe('#save') do
  it('saves a word') do
    words = Word.new
    ("Grant")
      words.save()
      words2 = Word.new("Bill") 
      words2.save()
      expect(Word.all).to(eq([words, words2]))
  end
end

describe('.all') do 
  it('return empty array') do
    expect(Word.all()).to(eq([]))
  end
end








end