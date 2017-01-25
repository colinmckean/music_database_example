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

  def self.all()
    sql = "SELECT * FROM artists;"
    artists = SqlRunner.run(sql)
    return artists.map { |artist| Artist.new(artist)  }
  end

  def albums
    sql = "SELECT * FROM albums WHERE artist_id='#{@id}';"
    artist = SqlRunner.run(sql)
    result = artist.map { |album| Album.new(album) } 
    return result
  end

end