def vowel?(character)
  vowels = ["a","e","i","o","u"]
  vowels.include?(character)
end

def to_pig_latin(word) 
  result = ''
  consonant_sequ = ''
  previous_letter = ''
  vowel_caught = false
  capital = (word =~ /[A-Z]/)
  word.downcase!

  word.each_char do |letter|
    if !vowel_caught
      if letter == 'u' && previous_letter == 'q'
        consonant_sequ += letter
      elsif vowel?(letter)
        vowel_caught = true
      elsif letter == 'y' && previous_letter != ''
        vowel_caught = true
      else
        consonant_sequ += letter
      end
    end
    previous_letter = letter
  end

  wordStart = word[consonant_sequ.length..word.length-1]
  if capital == 0
    wordStart.capitalize!
  end
  result += wordStart + consonant_sequ.downcase + 'ay'
end

def pig_latin(string)
  result = ''
  word_array = string.scan(/([a-zA-Z']+)([^a-zA-Z']*)/)

  word_array.each do |pair|
    pair.each do |element|
      if element =~ /[a-z]/i
        result += to_pig_latin(element)
      else
        result += element
      end
    end
  end

  result
end
