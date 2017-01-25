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
    sql = " INSERT 
            INTO albums(title,       genre,      artist_id) 
            VALUES ('#{@title}', '#{@genre}', '#{artist_id}') 
            returning *;"
    @id = SqlRunner.run(sql)[0]["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums;"
    return SqlRunner.run(sql).map { |album| Album.new(album) }
  end

  def artist
    sql = " SELECT * 
            FROM  artists 
            WHERE id='#{@artist_id}';"
    return SqlRunner.run(sql).map { |artist| Artist.new(artist) }
  end

  def update
    sql = "UPDATE albums 
           SET (title,       genre,      artist_id) = 
           ('#{@title}', '#{@genre}', '#{artist_id}') 
           WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE 
           FROM albums 
           WHERE id=#{@id}"
    SqlRunner.run(sql)
  end

  def self.find(id_to_find)
    sql = " SELECT * 
            FROM albums 
            WHERE id='#{id_to_find}'"
    return SqlRunner.run(sql).map { |album| Album.new(album) }
  end
end