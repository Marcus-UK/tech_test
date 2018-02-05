require_relative 'forensics_api'

class Kitten_finder# works out the location of kittens based on directions passed.

  attr_reader :directions, :current_direction


  def initialize(api = Forensics_api.new, current_direction = 'North')#initialize kitten_finder class with an instance of api
    @api = api #instance of api
    @directions = ["North", "East", "South", "West"]#array of four possible directions a searcher can be facing
    @current_direction = current_direction #starting direction . Hard coded
    @x_location = 0 #start location on x-axis
    @y_location = 0 #start location on y-axis
  end

  def locate_kittens
    @api.retrieve_directions.each do |instruction|
      instruction_guide(instruction)
    end
    current_location
  end

  def confirm_kitten_location # makes a call to the api class to call submit location and return confirmation.
    @api.submit_kitten_location(@x_location, @y_location)
  end

  def current_location #getter method to return the x and y coordinates in a single array.
    [@x_location, @y_location]
  end

  def move_forward # Instructs searcher to move forward in the direction they are currently facing.
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

  def change_direction_right #changes direction of searcher to right when instructed.
    index = get_direction_index
    index < 3 ? index += 1 : index = 0
    @current_direction = @directions[index]
  end

  def change_direction_left# changees direction of searcher to left when instructed.
    index = get_direction_index
    index > 0 ? index -= 1 : index = 3
    @current_direction = @directions[index]
  end

  private

  def get_direction_index
    @directions.find_index(@current_direction)
  end

  def instruction_guide(instruction)
    case instruction
    when 'forward'
      move_forward
    when 'left'
      change_direction_left
    when 'right'
      change_direction_right
    end
  end
end
