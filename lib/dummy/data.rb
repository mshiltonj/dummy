module Dummy; end;

class Dummy::Data
    WORD_FILE = '/usr/share/dict/words'
    def self.words(min = 25, max = 255)
        wrds = '' 
        random_length = rand(max - min) + min
        word_file = File.new(WORD_FILE)
        while 1 do 
            # pick a random spot in the file
            location = rand(word_file.stat.size)
            location -= 100 if location > 100
            word_file.seek(location) # slight hack to avoid the EOF
            word_file.readline # throw this one away since we prolly started mid-word
            wrd =  word_file.readline.strip
            break if wrds.length + wrd.length > random_length 
            wrds << " " + wrd
        end
        word_file.close
        wrds.strip
    end

    def self.text(min = 2048, max = 4096) 
        txt = ''
        random_length = rand(max - min) + min
        while 1 do
            sentence = words(5)
            sentence << ". "
            sentence << "\n\n" if rand(5) == 1
            break if txt.length + sentence.length > random_length
            sentence.capitalize!
            txt << sentence
        end
        txt.strip 
    end

    def self.date()
        epoch = Time.parse('1970/01/01')
    end
end
