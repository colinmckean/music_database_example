require 'pg'
require_relative '../db/SqlRunner'

class Artist

  attr_accessor :id, :name

  def initialize(options)
    @id = options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT 
           INTO artists(name) 
           VALUES ( '#{@name}')
           returning*;"
    @id = SqlRunner.run(sql)[0]["id"].to_i
  end

  def self.all()
    sql = "SELECT * 
           FROM artists;"
    return SqlRunner.run(sql).map { |artist| Artist.new(artist) }
  end

  def albums
    sql = "SELECT * 
           FROM albums 
           WHERE artist_id = '#{@id}';"
    return SqlRunner.run(sql).map { |album| Album.new(album) }
  end

  def update
    sql = "UPDATE artists 
           SET (name) = ('#{@name}') 
           WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE 
           FROM artists 
           WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.find(id_to_find)
    sql = "SELECT * 
           FROM artists 
           WHERE id = '#{id_to_find}';"
    return SqlRunner.run(sql).map { |artist| Artist.new(artist) }
  end
end