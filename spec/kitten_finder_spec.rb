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
      kitten_east = Kitten_finder.new(api_dbl, 'East')
      kitten_east.change_direction_right
      expect(kitten_east.current_direction).to eq "South"
    end

    it 'turns you to face West from a starting point of South' do
      kitten_south = Kitten_finder.new(api_dbl, 'South')
      kitten_south.change_direction_right
      expect(kitten_south.current_direction).to eq "West"
    end

    it 'turns you to face North from a starting point of West' do
      kitten_west = Kitten_finder.new(api_dbl, 'West')
      kitten_west.change_direction_right
      expect(kitten_west.current_direction).to eq "North"
    end
  end

  describe '#change_direction_left' do

    it 'turns you to face west from a starting direction of North' do
        kitten.change_direction_left
        expect(kitten.current_direction).to eq "West"
    end

    it 'turns you to face South from a starting point of West' do
      kitten_west = Kitten_finder.new(api_dbl, 'West')
      kitten_west.change_direction_left
      expect(kitten_west.current_direction).to eq "South"
    end

    it 'turns you to face East from a starting point of South' do
      kitten_south = Kitten_finder.new(api_dbl, 'South')
      kitten_south.change_direction_left
      expect(kitten_south.current_direction).to eq "East"
    end

    it 'turns you to face North from a starting point of East' do
      kitten_east = Kitten_finder.new(api_dbl, 'East')
      kitten_east.change_direction_left
      expect(kitten_east.current_direction).to eq "North"
    end
  end

  describe '#current_location' do

    it 'starts with a location of 0,0' do
      expect(kitten.current_location).to eq [0,0]
    end
  end

  describe '#move_forwards' do

    it 'moves you forwards one square North when you are facing North' do
      kitten.move_forward
      expect(kitten.current_location).to eq [0, 1]
    end

    it 'moves South one square when facing South' do
      kitten_south = Kitten_finder.new(api_dbl, 'South')
      kitten_south.move_forward
      expect(kitten_south.current_location). to eq [0, -1]
    end

    it 'moves East one square when facing East' do
      kitten_east = Kitten_finder.new(api_dbl, 'East')
      kitten_east.move_forward
      expect(kitten_east.current_location). to eq [1, 0]
    end

    it 'moves West one square when facing West' do
      kitten_west = Kitten_finder.new(api_dbl, 'West')
      kitten_west.move_forward
      expect(kitten_west.current_location). to eq [-1, 0]
    end
  end

  describe '#locate_kittens' do

    it 'uses instructions to update x and y locations' do
      expect(kitten.locate_kittens).to eq [1, 2]
    end
  end
end
