require 'pry'
class Song
    @@all = []
    attr_accessor :name, :artist
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.new_by_filename(file)
        new_artist, song_title = file.split(" - ")
        s = Song.new(song_title)
        s.artist_name = new_artist
        s
    end

    def artist_name=(nomen)
        self.artist = Artist.find_or_create_by_name(nomen)
    end



    def self.all
        @@all
    end
end
