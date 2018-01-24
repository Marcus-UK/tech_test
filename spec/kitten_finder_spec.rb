require './lib/kitten_finder.rb'

describe Kitten_finder do
  subject(:kitten) {described_class.new(api_dbl)}
  let(:api_dbl) {double :forensics_api,
                :retrieve_directions => ['forward', 'right', 'forward', 'left', 'forward']}

  it 'is instantiated with an array of directions' do
    expect(kitten.directions).to eq ["North", "East", "South", "West"]
  end

  it 'is instantiated with a starting direction of North' do
    expect(kitten.current_direction).to eq "North"
  end

  describe '#change_direction_right' do

    it 'turns you to face East from a starting point of North' do
      kitten.change_direction_right
      expect(kitten.current_direction).to eq "East"
    end

    it 'turns you to face South from a starting point of East' do
      kitten.current_direction = 'East'
      kitten.change_direction_right
      expect(kitten.current_direction).to eq "South"
    end

    it 'turns you to face West from a starting point of South' do
      kitten.current_direction = 'South'
      kitten.change_direction_right
      expect(kitten.current_direction).to eq "West"
    end

    it 'turns you to face North from a starting point of West' do
      kitten.current_direction = "West"
      kitten.change_direction_right
      expect(kitten.current_direction).to eq "North"
    end
  end
end
