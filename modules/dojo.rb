require_relative "person"
require_relative "room"

class Dojo
    # Andela facility called the dojo
    # attribute readwers
    attr_reader :all_rooms, :all_employees, :all_fellows, :all_staff
    def initialize
        @all_offices ,@all_livingspaces = [] 
        @all_rooms = []
        @avialable_offices ,@avialable_livingspaces = []
        @all_employees = []
        @all_staff = []
        @all_fellows = []
        @unallocated_offices ,@unallocated_livingspaces = []
    end

    def create_room(room_name, room_type)
        # Create a room at the facility
        
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
    
    def allocate_office(employee)
        # allocate a office space to an employee
        # allocate employee to random office
        if @avialable_offices.nil?
            random_office = @avialable_offices.sample

            # remove room from avialable rooms is occupants are 6
            if random_office.length = 6
                @avialable_offices.delete(random_office)
            end

            # allocate employye to random office
            random_office << employee
            return random_office.room_name
        else
            @unallocated_offices << employee
            return "Unallocated Office"
        end
    end

    def allocate_living(employee)
        # allocate a living space to an employee
        # allocate employee to random living space
        if @avialable_livingspaces.nil?
            random_livingspace = @avialable_livingspaces.sample

            # remove room from avialable rooms is occupants are 6
            if random_livingspace.length = 4
                @avialable_livingspaces.delete(random_livingspace)
            end

            # allocate employye to random office
            random_livingspace << employee
            return random_livingspace.room_name
        else
            @unallocated_offices << employee
            return "Unallocated Office"
        end
    end

    def add_employee(person_name, person_type, wants_accomodation="N")
        # add an employee

        # Check for duplicates
        unless @all_employees.nil?
            @all_employees.each do |employee|
                if employee.person_name.downcase == person_name.downcase
                    return "Employee #{employee.person_name} already exist"
                end
            end
        end

        begin
            # set user id
            unless @all_employees.nil?
                id = @all_employees.length + 1
            else
                id = 1
            end

            if person_type.downcase == "fellow"
                new_employee = Fellow.new(id, person_name)
                @all_fellows << new_employee
                @all_employees << new_employee
                allocate_office(new_employee)
                
                # allocalte living space rooms
                if wants_accomodation.downcase == "y"
                    allocate_living(new_employee)
                end

            elsif person_type.downcase == "staff"
                new_employee = Staff.new(id, person_name)
                @all_staff << new_employee
                @all_employees << new_employee
            else
                return "Invalid employee type."
            end
            
            allocate_office(new_employee)
            @all_employees << new_employee
            return "Succesfully added #{new_employee.person_name}"
        rescue
            return "Couldn't successfully add employee"
        end
    end
end
