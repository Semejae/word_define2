require('pry')
require('rspec')
require('definition')
require('word')

describe '#definition' do

  before(:each) do
    Word.clear()
    Definition.clear()
    @word =Word.new("Grant",nil)
    @word.save()
  end

  describe('#==') do 
  it('if definition matches another definition') do
    definition = Definition.new("Grant", @word.id, nil)
    definition2 = Definition.new("Grant", @word.id, nil)
    expect(definition).to(eq(definition2))
  end
end

describe('.all') do 
  it('return a list of all definitions') do
    definition = Definition.new("Grant", @word.id, nil)
    definition.save()
    definition2 = Definition.new("Small", @word.id, nil)
    definition.save()
    expect(Definition.all()).to(eq([definition,definition2]))
  end
end

describe('.clear') do 
  it('clear all definition') do 
    definition = Definition.new("Giant steps", @word.id, nil)
    definition.save()
    definition2 = Definition.new("Billy", @word.id, nil)
    definition.save()
    Definition.clear()
    expect(Definition.all).to(eq([]))
  end
end

describe('#save') do 
  it('saves a definition') do  
    definition = Definition.new("Big", @word.id, nil)
    definition.save()
    expect(Definition.all).to(eq([definition]))
  end
end

describe('.find') do
  it('finds a definition by id') do
    definition = Definition.new("Grant", @word.id, nil)
    definition.save()
    definition2 = Definition.new("Small", @word.id, nil)
    definition.save()
    expect(Definition.find(definition.id)).to(eq(definition))
  end
end

describe('#update') do
  it('updates an definition by id') do
    definition = Definition.new("Big", @word.id, nil)
    definition.save()
    definition.update("Small", @word.id, nil)
    expect(definition.name).to(eq("Small"))
  end
end

describe('#delete') do
  it('deletes an definition by id') do
    definition = Definition.new("Giant", @word.id, nil)
    definition.save()
    definition2 = Definition.new("Small", @word.id, nil)
    definition2.save()
    definition.delete()
    expect(Definition.all).to(eq([definition2]))
  end
end

describe('.find_by_word') do 
  it('finds definition for a word') do
    words2 = Word.new("Grant", nil)
    words2.save()
    definition = Definition.new("Big", @word.id, nil)
    definition.save()
    definition2 = Definition.new("Small", words2.id , nil)
    definition2.save()
    expect(Definition.find_by_word(words2.id)).to(eq([definition2]))
  end
end

end

