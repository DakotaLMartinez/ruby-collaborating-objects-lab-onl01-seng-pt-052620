artist -> songs
artist has many songs (one to many)

song -> artist
song belongs to artist (one to one)
song can have a reference to the artist

where do we store instances of a class? 
an array (a class variable) we call it `@@all`

If We wanted many_to_many (Artist has many songs and song has many artists)
class Artist 
  def song_artists
    SongArtist.all.select do |song_artist|
      song_artist.artist == self
    end
  end
  
  def songs 
    song_artists.map do |song_artist| 
      song_artist.song
    end
  end
end 

class Song 
  def song_artists
    SongArtist.all.select do |song_artist|
      song_artist.song == self
    end
  end
  
  def artists 
    song_artists.map do |song_artist| 
      song_artist.artist
    end
  end
end 

class SongArtist 
  attr_reader :song, :artist
  # each instance has a reference to a single song and a single artist
  @@all = [] 
  def initialize(attributes)
    @song = attributes[:song]
    @artist = attributes[:artist]
  end
  
  def self.all 
    @@all
  end
end

students = [
  {
    name: "Jose", 
    hometown: "Florence",
    favorite_movie: "The Matrix"
  },
  {
    name: "Patrick", 
    hometown: "Richmond",
    favorite_movie: "The Hours"
  },
  {
    name: "Anatoliy", 
    hometown: "Brooklyn",
    favorite_movie: "Saving Private Ryan"
  },
  {
    name: "Angela", 
    hometown: "Houston",
    favorite_movie: "The Holiday"
  }
]

students.map{|student_hash| student_hash[:name]}

