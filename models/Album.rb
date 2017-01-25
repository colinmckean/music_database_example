require 'pg'
require_relative '../db/SqlRunner'

class Album

  attr_accessor :id, :title, :genre, :artist_id
  def initialize(options)
    
  end
end