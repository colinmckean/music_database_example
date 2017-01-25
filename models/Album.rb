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

  def self.all()
    sql = "SELECT * FROM albums;"
    albums = SqlRunner.run(sql)
    result = albums.map { |album| Album.new(album) }
    return result
  end
  def artist
    sql = "SELECT * FROM  artists WHERE id='#{@artist_id}';"
    artists = SqlRunner.run(sql)
    result = artists.map { |artist| Artist.new(artist)  }
    return result
  end

  def update_album
    sql = "UPDATE albums SET (title, genre, artist_id) = ('#{@title}', '#{@genre}', '#{artist_id}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete_album
    sql = "DELETE FROM albums WHERE id=#{@id}"
    SqlRunner.run(sql)
  end

  def self.find_by_id(id_to_find)
    sql = "SELECT * FROM albums WHERE id='#{id_to_find}'"
    albums = SqlRunner.run(sql)
    result = albums.map { |album| Album.new(album)  }
    return result
  end
end

#List all the albums they have by an artist
