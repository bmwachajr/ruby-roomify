#require_relative "person"
require_relative "room"
require_relative "dojo"
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

    def test_create_room_at_dojo
        dojo = Dojo.new

        # add rooms
        dojo.create_room("Oculus", "office")
        dojo.create_room("Valhala", "office")
        dojo.create_room("St Cathy", "livingspace")

        # asserts
        assert_equal(3, dojo.all_rooms.length)
    end

    def test_add_fellow
        dojo = Dojo.new

        dojo.add_employee("Benjamin Wacha", "fellow", "N")
        dojo.add_employee("Ben Habib", "staff")
        assert_equal(2, dojo.all_employees.length)
        assert_equal(1, dojo.all_fellows.length)
        assert_equal(1, dojo.all_staff.length)
    end

end
