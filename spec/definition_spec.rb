require('pry')
require('rspec')
require('definition')
require('word')

describe '#definition' do

  # before(:each) do
  #   Word.clear()
  #   Definition.clear()
  #   @word =Word.new("Grant",nil)
  #   @word.save()
  # end

  describe('#==') do 
  it('if definition matches another definition') do
    definition = Definition.new("Grant", @word.id, nil)
    definition2 = Definition.new("Grant", @word.id, nil)
    expect(definition).to(eq(definition2))
  end
end
