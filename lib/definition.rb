require('pry')

class Definition
  attr_reader :id
  attr_accessor :name, :word_id

  @@definition = {}
  @@total_row = 0

  def initialize(name, word_id, id)
    @name = name
    @word_id = word_id
    @id = id || @@total_row += 1
  end

  def ==(definition_to_compare)
    (self.name() == definition_to_compare.name()) && (self.word_id() == definition_to_compare.word_id())
  end

  def self.all
    @@definition.values
  end

  def self.clear
    @@definition = {}
  end

  def save
    @@definition[self.id] = Definition.new(self.name, self.word_id, self.id)
  end

  def self.find(id)
    @@definition[id]
  end

  def update(name, word_id)
    self.name = name
    self.word_id = word_id
    @@definition[self.id] = Definition.new(self.name, self.word_id, self.id)
  end

  def delete
    @@definition.delete(self.id)
  end

  def self.find_by_word(word_id)
    definition_array = []
    @@definition.values.each do |definition| 
      if definition.word_id == word_id
        definition_array.push(definition)
      end
    end
    definition_array
  end
  
  def word
    Word.find(self.word_id)
  end

end
