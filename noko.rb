require 'nokogiri'
require 'open-uri'


webpage = 'http://www.jpopasia.com/lyrics/akb48/'
doc = Nokogiri::HTML(open(webpage))

INDEX = {
  TRANSLATION: 8,
  KANJI: 6,
  ROMAJI: 4
}
STRINGVAL = {
  TRANSLATION: 'translation',
  KANJI: 'kanji',
  ROMAJI: 'romaji'
}

REQ_ATTRIBUTES = [
#:TRANSLATION,
:KANJI,
:ROMAJI
]

valid_pages = []
doc.css('tr.highlight').each do |v|
	attributes = v.children
	valid_pages.push(attributes.children[1].attributes["href"].value) if (REQ_ATTRIBUTES.all? {|att| attributes[INDEX[att]].children[0].text == STRINGVAL[att] })
end
