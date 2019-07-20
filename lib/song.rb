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
    song = self.create
    song.name = name
    return song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    result = self.find_by_name(name)
    if result
      result
    else
      self.create_by_name(name)
    end
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

  def self.create_from_filename(filename)
    result = self.new_from_filename(filename)
    song = self.create
    song.name = result.name
    song.artist_name = result.artist_name
    song
  end

  def self.artist_name(artist_name)
    @artist_name = artist_name
  end


  def self.destroy_all
    self.all.clear
  end

end
