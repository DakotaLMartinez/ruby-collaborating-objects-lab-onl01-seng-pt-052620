class Artist 
  
  @@all = [] 
  
  def self.all 
    @@all  
  end
  
  def self.find_by_name(name)
    self.all.find do |artist| 
      artist.name == name
    end
  end 
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.new(name)
  end
  
  attr_accessor :name
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def add_song(song)
    song.artist = self
  end
  
  def songs 
    Song.all.select do |song|
      song.artist == self  
    end
  end
  
  def print_songs 
    self.songs.each do |song|
      puts song.name
    end
  end
  
end