def vowel?(character)
  vowels = ["a","e","i","o","u"]
  vowels.include?(character)
end

def to_pig_latin(word) 
  result = ''
  consonant_sequ = ''
  capital = (word =~ /[A-Z]/)
  word.downcase!

  for i in 0..(word.length-1)
    if word[i] == 'u' && i >0 && word[i-1] == 'q'
      consonant_sequ += word[i]
      next
    end
    if vowel?(word[i])
      initial_vowel_index = i
      break
    elsif word[i] == 'y' && i > 0
      initial_vowel_index = i
      break
    end
    consonant_sequ += word[i]
  end

  wordStart = word[initial_vowel_index..word.length-1]
  if capital == 0
    wordStart.capitalize!
  end
  result += wordStart + consonant_sequ.downcase + 'ay'
end

def pig_latin(string)
  result = ''
  word_array = string.scan(/([a-zA-Z']+)([^a-zA-Z']*)/)

  word_array.each {|pair|
    pair.each {|element|
      if element =~ /[a-z]/i
        result += to_pig_latin(element)
      else
        result += element
      end
    }
  }

  result
end
