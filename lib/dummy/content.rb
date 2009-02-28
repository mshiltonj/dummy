module Dummy; end;

class Dummy::Content
  WORD_FILE = '/usr/share/dict/words'

  #index is word length
  FILL_WORDS = [
    '',
    'a',
    'of',
    'the',
    'main',
    'choir',
    'barter',
    'expires',
    'children',
    'cardboard',
    'protrusion',
    'extrication',
    'triumvirates',
    'informational',
  ]

  MAX_EDGE_CASE_TRIES = 5
  class << self
    def get_random_word(fh)
      location = rand(fh.stat.size)
      location -= 100 if location > 100
      fh.seek(location) # slight hack to avoid the EOF
      fh.readline # throw this one away since we prolly started mid-word
      wrd = fh.readline.strip
    end
    private :get_random_word

    def get_random_length(min, max)
      (rand(max - min) + min).to_i
    end

    private :get_random_length

    def words(min = 25, max = 255)
      wrds = '' 
      old_wrds = ''
      random_length = get_random_length(min, max)
      word_file = File.new(WORD_FILE)
      edge_case_tries = 0
      while 1 do 
        # pick a random spot in the file
        wrds << ' ' unless wrds == ''
        wrds << get_random_word(word_file)
#        puts "--------"
#        puts "WORDS: #{wrds}"
#        puts "MIN: #{min}"
#        puts "MAX: #{max}"
#        puts "WL: #{wrds.length}"
#        puts "RANDOM LENGTH: #{random_length}"
        if wrds.length >= random_length 

          if wrds.length <= max && wrds.length >= min
            #done
#            puts 1
            break
          elsif old_wrds.length <= max && old_wrds.length >= min
            # go back to previous one
#            puts 2
            wrds = old_wrds.clone
            break
          else
            # edge case, where the min and max are too close together
            # let's try a few more times
            edge_case_tries +=1
           
            unless edge_case_tries >= MAX_EDGE_CASE_TRIES
#              puts 3
              # back up and try again
              wrds = old_wrds.clone
              next
            end
#            puts 4

#            puts "LEN: #{wrds.length}"
            # we tried a few times, now we force it
            wrds = old_wrds.clone
            word_length_needed = min - wrds.length 
            if word_length_needed == 1
#              puts "exactly one"
              wrds << 's'
            else
#              puts "xxx"
#              puts FILL_WORDS[0].inspect         
#              puts word_length_needed
#              puts "xxx"
              wrds << " " + FILL_WORDS[word_length_needed - 1]
#              puts "======="
#              puts "greater != 1"
#              puts "WLN: #{word_length_needed}"
#              puts "LEN3: #{wrds.length}"
#              puts wrds
#              puts "======="
            end
            break
          end
        end
        old_wrds = wrds.clone
      end
      word_file.close
      wrds = wrds.strip
      #puts "LEN: #{wrd.length}"
      #puts "======"
      wrds
    end

    def text(min = 2048, max = 4096) 
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

    def date()
      epoch = Time.parse('1970/01/01')
    end
  end
end
