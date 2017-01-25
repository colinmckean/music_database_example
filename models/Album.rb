require 'pg'
require_relative '../db/SqlRunner'

class Album

  attr_accessor :id, :title, :genre, :artist_id
  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums(title, genre, artist_id) VALUES ('#{@title}', '#{@genre}', '#{artist_id}') returning *;"
    result = SqlRunner.run(sql)
    @id = result[0]["id"].to_i
  end
end