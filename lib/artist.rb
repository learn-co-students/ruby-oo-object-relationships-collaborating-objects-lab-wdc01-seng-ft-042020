require 'pry'
require_relative './song.rb'
class Artist
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end
    def songs
        Song.all.select {|s| s.artist == self}
    end

    def add_song(song_obj)
        song_obj.artist = self
    end

    def self.find_or_create_by_name(name_str)
        self.all.find {|a_obj| a_obj.name == name_str} ? self.all.find {|a_obj| a_obj} : Artist.new(name_str)
    end

    def print_songs
        puts self.songs.map {|s| s.name}
    end

    def self.all
        @@all
    end
end
