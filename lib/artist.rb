require 'pry'
class Artist

    attr_accessor :name

    @@all =[]

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end
# ---------------------------------------------------------------------------
    def songs
        Song.all.select {|song| self == song.artist}
    end
# ---------------------------------------------------------------------------
    def add_song(song)
        song.artist = self
    end

# ---------------------------------------------------------------------------

    def self.find_or_create_by_name(name)
        self.find(name) ? self.find(name) : self.new(name)
    end

    def self.find(name)
        self.all.find {|artist| artist.name == name}
    end

    #do you find a matching name? if not make a new one ^^
# ---------------------------------------------------------------------------

    def print_songs
        songs.each {|song| puts song.name}
    end
    


end
