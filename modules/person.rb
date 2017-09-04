class Person
    # Employees at the facilit
    # attribute readers
    attr_reader :person_name, :person_type, :person_idy
    def initialize(person_id, person_name, person_type)
        @person_id = person_id
        @person_name = person_name
        @person_type = person_type
        @office_space = "unallocated"
    end
end

class Fellow < Person
    # An employee that is a fellow
    def initialize(person_id, person_name)
        super(person_id, person_name, person_type="Fellow")
    end
end

class Staff < Person
    # An employee that is a staff member
    def initialize(person_id, person_name)
        super(person_id, person_name, person_type="Staff")
    end
end
