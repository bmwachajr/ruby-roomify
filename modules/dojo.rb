require_relative "person"
require_relative "room"

class dojo
    # Andela facility called the dojo
    def initialize
        @all_offices ,@all_livingspaces, @all_rooms = []
        @avialable_offices, @avialable_livingspaces = []
        @all_employees. @all_staff, @all_fellows = []
        @unallocated_offices, @unallocated_livingspaces = []
    end

    def create_room(room_name, room_type)
        # Create a room at the facilit
        
        # check for duplicates
        @all_rooms.each do |room|
            if room.room_name = room_name
                return "#{room.room_name} already exists"
            end
        end

        # add office spaces
    end
