class Kitten_finder

  attr_reader :directions
  attr_accessor :current_direction

  def initialize(api = Forensics_api.new)
    @api = api
    @directions = ["North", "East", "South", "West"]
    @current_direction = "North"
  end

  def change_direction_right
    index = get_direction_index
    index < 3 ? index += 1 : index = 0
    @current_direction = @directions[index]
  end

  private

  def get_direction_index
    @directions.find_index(@current_direction)
  end
end
