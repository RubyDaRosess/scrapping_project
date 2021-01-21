require "pry"
require "rubygems"
require "nokogiri"
require "open-uri"

PAGE_URL = "https://coinmarketcap.com/all/views/all/"

def to_get_symbols(page)
  return page.xpath('//*[@class="cmc-table-row"]//td[3]/div').map { |div| div = div.text }
end

def to_get_prices(page)
  return page.xpath('//*[@class="cmc-table-row"]//td[5]/div/a').map { |a| a = a.text.delete("$").to_f }
end

#def click_on_button (page)
#  button = page.xpath('/html/body/div/div[1]/div[2]/div/div[1]/div/div[3]/button')
#  button.each do |button|  # for each button
#    button.click  #click on the button
#  end
#end

def crypto_scrapper
  page = Nokogiri::HTML(URI.open(PAGE_URL))
  #click_on_button(page)
  array_symbols = to_get_symbols(page)
  array_prices = to_get_prices(page)
  hash = {}
  array_symbols.each_with_index do |value, index|
    hash[value] = array_prices[index]
  end
  hash_to_array = Array.new
  hash.each { |key, value| hash_to_array += [Hash[key, value]] }
  #binding.pry
  return hash_to_array
end

print crypto_scrapper
