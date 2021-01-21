describe "the crypto_scrapper method" do
  it "should return an array" do
    expect(crypto_scrapper().to be_an_instance_of(Array)
  end
  it "should return an array" do
    expect(crypto_scrapper().to eq(Array) #vérifier que le scrappeur récupère au moins x cryptomonnaies
  end
  it "should return an array" do
    expect(crypto_scrapper().to eq(Array) #vérifier la présence des cryptomonnaies : BTC,  (avec un cours non Nil et non nul)
  end
end