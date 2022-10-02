require('pry')

class Word
  attr_reader :id, :name

  @@words = {}
  @@total_row = 0

  def inittialize(name, id)
    @name = name
    @id = id || @@total_row += 1
  end

  def save()
    @@words[self.id] = Word.new(self.name, self.id)
  end

  def self.all()
    @@words.values
  end
  


end