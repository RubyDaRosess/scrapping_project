require "pry"
require "rubygems"
require "nokogiri"
require "open-uri"

page = Nokogiri::HTML(open("http://en.wikipedia.org/"))
puts page.class   # => Nokogiri::HTML::Document

def crypto_scrapper
  return #Array de hash
end
