require 'pry-byebug'
require_relative 'Album'
require_relative 'Artist'

artist_1 = Artist.new( 'name' => 'ED SHEERAN' )
artist_2 = Artist.new( {'name' => 'Beyonce'} )
artist_3 = Artist.new( {'name' => 'Colin'} )

artist_1.save
artist_2.save
artist_3.save

album_1 = Album.new( {'title' => 'Songs I wrote with Amy', 
                    'genre' => 'Acoustic music' , 
                    'artist_id' => artist_1.id} )
 album_2 = Album.new( {'title' => 'Lemonade', 
                       'genre' => 'RnB', 
                       'artist_id' =>  artist_2.id} )

album_3 = Album.new( {'title' => 'Dangerously in Love', 
                      'genre' => 'RnB', 
                      'artist_id' => artist_2.id} )
album_4 = Album.new( {'title' => 'Loose Change', 
                      'genre' => 'Acoustic music' , 
                      'artist_id'=> artist_1.id} )
album_5 = Album.new( {'title' => 'the slumdon bridge', 
                      'genre' => 'Acoustic music' , 
                      'artist_id'=> artist_1.id} )

album_1.save
album_2.save
album_3.save
album_4.save
album_5.save

binding.pry

nil