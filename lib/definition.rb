require('pry')

class Definition
  attr_reader :id
  attr_accessor :name, :word_id

  @@definition = {}
  @@total_row = 0

  def ==(definition_to_compare)
    (self.name() == definition_to_compare.name()) && (self.word_id() == definition_to_compare.word_id())
  end
  