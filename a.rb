require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    return song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    result = self.find_by_name(name)
    if result
    else
      self.create_by_name(name)
    end
    binding.p
  end


  def self.find_or_create_by_name2(title)
  #either return a matching song instance with that name or create a new song with the name and return the song instance
  result = self.find_by_name(title)
  if result
    result
  else
    self.create_by_name(title)
  end
  binding.pry
end

  def self.alphabetical
     self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file)
    name_artist_string = file.chomp(".mp3")
    name_artist = name_artist_string.split(" - ")
    song = self.new
    song.artist_name = name_artist[0]
    song.name = name_artist[1]
    song
  end

  def self.artist_name(artist_name)
    @artist_name = artist_name
  end


  def self.destroy_all
    self.all.clear
  end

end

Song.find_or_create_by_name2("John")
Song.find_or_create_by_name2("Stuart")
Song.find_or_create_by_name2("John")
