class Kitten_finder

  attr_reader :directions
  attr_accessor :current_direction

  def initialize(api = Forensics_api.new)
    @api = api
    @directions = ["North", "East", "South", "West"]
    @current_direction = "North"
    @x_location = 0
    @y_location = 0
  end

  def current_location
    [@x_location, @y_location]
  end

  def move_forward
    case @current_direction
    when "North"
      @y_location += 1
    when "South"
      @y_location -= 1
    when "East"
      @x_location += 1
    when "West"
      @x_location -= 1
    end
  end 

  def change_direction_right
    index = get_direction_index
    index < 3 ? index += 1 : index = 0
    @current_direction = @directions[index]
  end

  def change_direction_left
    index = get_direction_index
    index > 0 ? index -= 1 : index = 3
    @current_direction = @directions[index]
  end

  private

  def get_direction_index
    @directions.find_index(@current_direction)
  end
end
