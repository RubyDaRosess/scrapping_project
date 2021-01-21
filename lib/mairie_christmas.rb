require "pry"
require "rubygems"
require "nokogiri"
require "open-uri"

def get_townhall_urls
  page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
  puts "Récuperation des urls"
  townhall_urls = page.xpath('//*[@class="lientxt"]').map do |a|
    a["href"]
    print townhall_urls
  end
  return townhall_urls #retourne le tableau des liens urls
end

def get_complete_townhall_urls(townhall_urls)
  complete_townhall_urls = Array.new
  townhall_urls.each do |url|
    page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/#{url}"))
    complete_townhall_urls << page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
    print complete_townhall_urls
  end
  return complete_townhall_urls #retourne un tableau des liens urls complets
end

def get_townhall_names
  page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
  puts "Récuperation des noms de villes"
  townhall_names = Array.new
  townhall_names = page.xpath('//*[@class="lientxt"]').map do |name|
    name = name.text
    print townhall_names
  end
  return townhall_names #retourne le tableau des noms des villes
end

def data_to_h(complete_townhall_urls, townhall_names)
  array = Array.new
  complete_townhall_urls.length.times do |i|
    hash = Hash.new
    hash[townhall_names[i]] = complete_townhall_urls[i]
    array << hash
  end
  return array
end

def perform
  townhall_urls = get_townhall_urls
  townhall_names = get_townhall_names
  complete_townhall_urls = get_complete_townhall_urls(townhall_urls)
  array = data_to_h(complete_townhall_urls, townhall_names)
  print array
end

perform

#Récupération d'un url
#def get_townhall_email(special_url)
#  townhall_common_url = "https://www.annuaire-des-mairies.com/95/"
#  townhall_url = townhall_common_url + special_url
#  page = Nokogiri::HTML(URI.open(townhall_url))
#  return page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
#end
