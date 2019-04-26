class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_genre_of_first_song
    #return the genre of the artist's first saved song
    self.songs.first.genre
  end

  def song_count
    #return the number of songs associated with the artist
    self.songs.length
  end

  def genre_count
    genre_arr = []
    #return the number of genres associated with the artist
    self.songs.each do |song|
      if genre_arr.find_index(song.genre_id) == nil
        genre_arr << song.genre_id
      end
      puts genre_arr
    end
    genre_arr.length
  end
end
