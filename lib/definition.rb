require('pry')

class Definition
  attr_reader :id
  attr_accessor :name, :word_id

  @@definition = {}
  @@total_row = 0

  