require './lib/forensics_api.rb'

describe Forensics_api do
  let(:api_url) { "http://which-technical-exercise-mock.com" }
  subject(:api) { described_class.new(api_url) }

  it 'is instantiated with a url for the forensics api' do
    expect(api.api_url).to eq "http://which-technical-exercise-mock.com"
  end

  describe '#request_api_directions' do
    it 'sends a request to api and returns an array of directions' do
      allow(api).to receive(:retrieve_directions) { ["forward", "right", "left"]}
      expect(api.retrieve_directions).to eq ["forward", "right", "left"]

    end
  end
end
