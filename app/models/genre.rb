class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    # return the number of songs in a genre
    self.songs.length
  end

  def artist_count
    # return the number of artists associated with the genre
    artist_arr = []
    self.songs.each do |song|
      if artist_arr.find_index(song.artist_id) == nil
        artist_arr << song.artist_id
      end
    end
    artist_arr.length
  end

  def all_artist_names
    # return an array of strings containing every musician's name
    artist_names = []
    self.songs.each do |song|
      if artist_names.find_index(song.artist.name) == nil
        artist_names << song.artist.name
      end
    end
    artist_names
  end
end
