require 'pg'
require_relative '../db/SqlRunner'

class Artist

  attr_accessor :id, :name
  def initialize(options)
    @id = options['id']
    @name = options['name']
  end
  def save()
    sql = "INSERT INTO artists(name) VALUES ('#{@name}')returning*;"
    result = SqlRunner.run(sql)
    @id = result[0]["id"].to_i
  end
end