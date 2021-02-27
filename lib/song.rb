require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  # def save
  #   self.all << self
  # end

  def self.create
    @song = self.new
    self.all << @song
    @song
  end

  def self.new_by_name(song)
    name = song
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(song)
    name = song
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    @name = name
    if !self.find_by_name(@name)
      self.create_by_name(@name) 
    else
      self.find_by_name(@name)
    end
  end

  def self.alphabetical
    # <=> 'Spaceship Operator':
    #  a <=> b :=
    # if a < b then return -1
    # if a = b then return  0
    # if a > b then return  1
    # if a and b are not comparable then return nil
    self.all.sort! { |a, b|  a.name <=> b.name }
  end

  def self.artists
    self.all.select {|songs| binding.pry and puts songs}
  end

  def self.new_from_filename(file)
    format_start = "- "
    format_end = ".mp3"

    artist = file.split(/\s-\s?/)[0]
    extension = file.split(".")[1]
    name = file[/#{format_start}(.*?)#{format_end}/m, 1]

    song = self.new
    song.name = name
    song.artist_name = artist
    song
  end

  def self.create_from_filename(file)
    format_start = "- "
    format_end = ".mp3"

    artist = file.split(/\s-\s?/)[0]
    extension = file.split(".")[1]
    name = file[/#{format_start}(.*?)#{format_end}/m, 1]

    song = self.new
    song.name = name
    song.artist_name = artist
    @@all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end
end