class Room
  # Class of a room instance
  attr_reader :room_name
  def initialize(room_id, room_name, room_type)
    @room_id = room_id
    @room_name = room_name
    @room_type = room_type
  end

  def room_name
      @room_name
  end
end

class LivingSpace < Room
  # Class of a living space instanc

  def initialize(room_id, room_name)
    @max_occupants = 4
    room_type = "living space"
    super(room_id, room_name, room_type)
    @room_occupants = []
  end
end

class OfficeSpace < Room
  # Class of a office space instanc

  def initialize(room_id, room_name)
    @max_occupants = 6
    room_type = "office space"
    super(room_id, room_name, room_type)
    @room_occupants = []
  end
end
