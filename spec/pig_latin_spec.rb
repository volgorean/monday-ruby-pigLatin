require('rspec')
require('pig_latin')

describe('pig_latin') do
  it('returns as string with words converted to Pig Latin') do
    pig_latin('Hello my name is Kat').should(eq('ellohay ymay amenay isay atkay'))
  end
end

describe('to_pig_latin') do
  it('returns a string representing a word converted to Pig Latin') do
    to_pig_latin('hello').should(eq('ellohay'))
  end
end
