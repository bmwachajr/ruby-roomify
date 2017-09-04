require_relative "person"
require_relative "room"

class Dojo
    # Andela facility called the dojo
    # attribute readwers
    attr_reader :all_rooms
    def initialize
        @all_offices ,@all_livingspaces = [] 
        @all_rooms = []
        @avialable_offices, @avialable_livingspaces = []
        @all_employees, @all_staff, @all_fellows = []
        @unallocated_offices, @unallocated_livingspaces = []
    end

    def all_rooms
        @all_rooms
    end

    def create_room(room_name, room_type)
        # Create a room at the facilit
        
        # check for duplicate
        unless @all_rooms.nil?
            @all_rooms.each do |room|
                if room.room_name == room_name
                    return "#{room.room_name} already exists"
                end
            end
        end

        # add office spaces
        if room_type.downcase == "office"
            begin
                room_id = all_rooms.length
                new_office = OfficeSpace.new(room_id, room_name)
                @all_rooms << new_office
                @all_offices << new_office
                @avialable_offices << new_office
                return "Office space #{new_office.room_name} was created uccessfully"
            rescue
                return "The office wqs not successfully created"
            end
        end

        # add living spaces
        if room_type.downcase == "livingspace"
            begin
                room_id = all_rooms.length
                new_living = LivingSpace.new(room_id, room_name)
                @all_rooms << new_living
                @all_livingspaces << new_living
                @avialable_livingspaces << new_living
                return "Office space #{new_office.room_name} was created uccessfully"
            rescue
                return "The office wqs not successfully created"
            end
        end
    end
end
