require 'pry'

class Song 

    @@count = 0
    @@genres = []
    @@artists = []
    @@genre_count = {}
    @@artist_count = {}

    attr_accessor :name, :artist, :genre

    def initialize(name, artist, genre) 
        @@count += 1

        @@genres << genre 
        @@artists << artist

        genre_count(genre)
        artist_count(artist)

        self.name = name
        self.artist = artist
        self.genre = genre 
    end

    def self.count
        @@count
    end 

    def self.genres 
        @@genres.uniq
    end 

    def self.artists
        @@artists.uniq
    end 

    def self.genre_count
        @@genre_count
    end

    def self.artist_count
        @@artist_count
    end

    def genre_count(genre)
        if @@genre_count.include?(genre)
            cur_val = @@genre_count["#{genre}"]
            @@genre_count["#{genre}"] = cur_val + 1 
        else 
            @@genre_count["#{genre}"] = 1 
        end
    end 

    def artist_count(artist)
        if @@artist_count.include?(artist)
            cur_val = @@artist_count["#{artist}"]
            @@artist_count["#{artist}"] = cur_val + 1 
        else 
            @@artist_count["#{artist}"] = 1 
        end
    end 

end 

s = Song.new('Believe','Cher','Pop')
s2 = Song.new('Own Way','Vanessa Hudges','Pop')
s3 = Song.new('Running Up','Cher','Rap')

puts Song.artists