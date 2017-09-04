#require_relative "person"
require_relative "room"
require "test/unit"

class AppTestCase < Test::Unit::TestCase

    def test_creates_room
        new_room = Room.new( 1, "St. Catherine", "Livingspace")
        assert_equal( "St. Catherine", new_room.room_name)
    end

    def test_create_officespace
        new_office = OfficeSpace.new(2, "Oculus")
        assert_equal("Oculus", new_office.room_name)
    end

    def test_create_living_space
        new_living_space = LivingSpace.new(3, "Ruby")
        assert_equal("Ruby", new_living_space.room_name)
    end

end
