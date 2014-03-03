def vowel?(character)
  vowels = ["a","e","i","o","u"]
  vowels.include?(character)
end

def to_pig_latin(word) 
  result = ''
  consonant_sequ = ''

  for i in 0..word.length-1
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

  result = word[initial_vowel_index..word.length-1] + consonant_sequ + 'ay'
end

def pig_latin(string)
  result = ''
  word_array = string.downcase.split(' ')
  result += to_pig_latin(word_array[0])
  for i in 1..word_array.length-1
    result += ' '
    result += to_pig_latin(word_array[i])
  end
  result
end

puts to_pig_latin('square')
puts pig_latin('Hello my name, is bob')
