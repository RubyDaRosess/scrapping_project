require_relative '../lib/dark_trader'

describe "the crypto_scrapper method" do
  it "should return an array" do
    expect(crypto_scrapper()).to be_an_instance_of(Array)
  end
  it "should return an array with a minimum length of 100" do
    expect(crypto_scrapper().length).to be >= 100 #vérifier que le scrappeur récupère au moins 100 cryptomonnaies
  end
  it "should not be nil with BTC key" do
    cryptos = crypto_scrapper
    index = cryptos.find_index{ |crypto_hash| crypto_hash["BTC"] != nil}
    expect(cryptos[index]["BTC"]).not_to eq(nil) #vérifier la présence des cryptomonnaies : BTC, ETH, USDT (avec un cours non Nil et non nul)
  end
  it "should not be nil with ETH key" do
    cryptos = crypto_scrapper
    index = cryptos.find_index{ |crypto_hash| crypto_hash["ETH"] != nil}
    expect(cryptos[index]["ETH"]).not_to eq(nil) 
  end
  it "should not be nil with USDT key" do
    cryptos = crypto_scrapper
    index = cryptos.find_index{ |crypto_hash| crypto_hash["USDT"] != nil}
    expect(cryptos[index]["USDT"]).not_to eq(nil) 
  end
end

# on s'attend à qlch du type : hash_crypto = [{:symbol=>"BTC", :price=>"$32,687.59"},{:symbol=>"ETH", :age=>"$1,255.26"}]