require_relative 'forensics_api'

class Kitten_finder# works out the location of kittens based on directions passed.

  attr_reader :directions, :current_direction


  def initialize(api = Forensics_api.new, current_direction = 'North')
    @api = api
    @directions = ["North", "East", "South", "West"]
    @current_direction = current_direction
    @x_location = 0
    @y_location = 0
  end

  def locate_kittens
    @api.retrieve_directions.each do |instruction|
      instruction_guide(instruction)
    end
    current_location
  end

  def confirm_kitten_location
    @api.submit_kitten_location(@x_location, @y_location)
  end

  def current_location
    [@x_location, @y_location]
  end

  def move_forward
    case @current_direction
    when "North" then @y_location += 1
    when "South" then @y_location -= 1
    when "East" then @x_location =+ 1
    when "West" then @x_location -= 1
    end
  end

  def change_direction_right
    index = get_direction_index
    index < 3 ? index += 1 : index = 0
    change_direction_index(index)
  end

  def change_direction_left
    index = get_direction_index
    index > 0 ? index -= 1 : index = 3
    change_direction_index(index)
  end

  private

  def get_direction_index
    @directions.find_index(@current_direction)
  end

  def change_direction_index(index)
    @current_direction = @directions[index]
  end

  def instruction_guide(instruction)
    case instruction
    when 'forward' then move_forward
    when 'left' then change_direction_left
    when 'right' then change_direction_right
    end
  end
end
