require File.expand_path(File.dirname(__FILE__) + '../../../spec_helper')

include MarketBot::Movie

test_id = :topselling_paid
test_category = :comedy

def stub_hydra(hydra)
  test_src_page = read_file(File.dirname(__FILE__), 'data', 'leaderboard-movies_comedy_topselling_paid.txt')
  response = Typhoeus::Response.new(:code => 200, :headers => '', :body => test_src_page)
  url = 'https://play.google.com/store/movies/category/COMEDY/collection/topselling_paid?start=0&gl=us&num=24&hl=en'
  Typhoeus.stub(url).and_return(response)
end

def check_results(results)
  it 'should have the top ranking app with valid details' do
    expect(results.first[:genre]).to eq('Comedy')
    expect(results.first[:stars]).to eq('3.6')
    expect(results.first[:title]).to eq('Dear White People')
    expect(results.first[:price_usd]).to eq('$4.99')
    expect(results.first[:market_id]).to eq('vRpjPMDxpg0')
    expect(results.first[:market_url]).to eq('https://play.google.com/store/movies/details/Dear_White_People?id=vRpjPMDxpg0&hl=en')
  end
end

describe 'Leaderboard' do
  context 'Construction' do
    it 'should copy params' do
      lb = MarketBot::Movie::Leaderboard.new(test_id, test_category)
      expect(lb.identifier).to eq(test_id)
      expect(lb.category).to eq(test_category)
    end

    it 'should copy optional params' do
      hydra = Typhoeus::Hydra.new
      lb = MarketBot::Movie::Leaderboard.new(test_id, test_category, :hydra => hydra)
      expect(lb.hydra).to equal(hydra)
    end

    it 'should have an optional category parameter' do
      lb = MarketBot::Movie::Leaderboard.new(test_id)
      expect(lb.identifier).to eq(test_id)
      expect(lb.category).to eq(nil)
    end
  end

  describe 'Updating' do
    context 'Quick API' do
      stub_hydra(Typhoeus::Hydra.hydra)
      lb = MarketBot::Movie::Leaderboard.new(test_id, test_category)
      lb.instance_variable_set('@hydra', Typhoeus::Hydra.hydra)
      lb.update(:min_rank => 1, :max_rank => 24)

      check_results(lb.results)
    end

    context 'Batch API' do
      hydra = Typhoeus::Hydra.new
      stub_hydra(hydra)
      lb = MarketBot::Movie::Leaderboard.new(test_id, test_category, :hydra => hydra)
      lb.enqueue_update(:min_rank => 1, :max_rank => 24)
      hydra.run

      check_results(lb.results)
    end
  end
end
