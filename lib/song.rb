# require 'pry'
class Song
  attr_accessor :name, :artist_name

  @@all = []

  def initialize
    save
  end 


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new 
    self.all << song 
    song 
  end 

  def self.new_by_name(title)
    song = self.new
    song.name = title 
    song
  end 

  def self.create_by_name(title)
    song = self.new
    song.name = title
    self.all << song 
    song 
  end 

  def self.find_by_name(title)
    result = self.all.detect {|song| song.name == title}
    # binding.pry 
    result
  end 

  def self.find_or_create_by_name(title)
    result_1 = self.find_by_name(title)
    if result_1 
      result_1
    else
    result_2 = self.create_by_name(title)
    result_2
    end 
  end

  def self.alphabetical
    sort = self.all.sort_by {|title| title.name }
    sort.uniq!
  end 

  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    song_array[1] = song_array[1].chomp(".mp3")  
    song = Song.new
    song.name = song_array[1] 
    song.artist_name = song_array[0]
    song        
    end 

  def self.create_from_filename(filename)
    result = self.new_from_filename(filename)
    song = self.create
    song.name = result.name
    song.artist_name = result.artist_name
    song 
  end 

  def self.destroy_all
    self.all.clear
  end 
end
  


