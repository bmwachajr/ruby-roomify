class Person
    # Employees at the facility
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
        super(person_id, person_name, person_type)
    end
end

class Staff < Person
    # An employee that is a staff member
    def initialize(person_id, person_name, person_tyoe)
        super(person_id, person_name, person_type)
    end
end
