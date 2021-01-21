require_relative '../lib/mairie_christmas'

describe "the  method" do
  it "should return an array" do
    expect(()).to be_an_instance_of(Array)
  end
  it "should return an array with a minimum length of 100" do
    expect(().length).to be 
  end
  it "should y" do
    cryptos = crypto_scrapper
    index = cryptos.find_index{ |crypto_hash| crypto_hash["BTC"] != nil}
    expect(cryptos[index]["BTC"]).not_to eq(nil) #vérifier la présence des cryptomonnaies : BTC, ETH, USDT (avec un cours non Nil et non nul)
  end
end