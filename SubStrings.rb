dictionary = ["i","and","to","it","ok","do"]
@word_hash = Hash.new(0)

def sub_strings(sentence, dictionary)
words = sentence.downcase.split(" ")
     words.each do |word|
         (0...dictionary.count).each do |i|
         @word_hash[dictionary[i]] += 1 if word.include? dictionary[i]
         end
     end
end

sub_strings("I am a test TO see what this does. ok?", dictionary)
puts @word_hash
