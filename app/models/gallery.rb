class Gallery

  attr_reader :name, :city
  attr_accessor :artist
  @@all = []

  def initialize(name, city)
    @name = name
    @city = city
    self.class.all << self
  end

  #Returns an array of all the galleries
  def self.all
  	@@all
  end

  #Returns an array of all paintings in a gallery
  def paintings
    Painting.all.select do |painting| 
      painting.gallery == self
    end
  end

  #Returns an array of all artists that have a painting in a gallery
  def artists
    paintings.map do |painting|
      painting.artist
    end
  end

  #Returns an array of the names of all artists that have a painting in a gallery
  def artist_names
    artists.map do |artist|
      artist.name
    end
  end

  #Returns an instance of the most expensive painting in a gallery
  def most_expensive_painting
    paintings.max_by do |painting|
      painting.price
    end
  end

end
