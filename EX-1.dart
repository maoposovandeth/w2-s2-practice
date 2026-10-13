  enum Skill { FLUTTER, DART, OTHER }

  class Employee {
    final List<Skill> _skills;
    final String _name;
    final double _baseSalary;
    int _yearsOfExperience;
    final Address _address;

    Employee(this._name, this._baseSalary, this._yearsOfExperience, this._skills, this._address);
    
    List<Skill> get skills => _skills;
    String get name => _name;
    double get baseSalary => _baseSalary;
    int get yearsOfExperience => _yearsOfExperience;
    Address get address => _address;

    Employee.mobileDeveloper(
      this._name, 
      this._baseSalary, 
      this._yearsOfExperience, 
      this._address
    ) : _skills = [Skill.FLUTTER, Skill.DART, Skill.OTHER]; 

    double calculateSalary() {
      const skillBonus = {Skill.FLUTTER : 5000, Skill.DART : 3000, Skill.OTHER : 1000};
      double bonus = _skills.fold(0, (sum, skill) => sum + (skillBonus[skill] ?? 0));
      // .fold() as an automated calculator loop that totals things up
      // 0 is the starting value
      //sum is the running total up to that point.
      // skillBonus[skill]: This looks up the skill in your custom map to see how much money it is worth (e.g., looking up Skill.DART returns 3000)
      // ?? 0: This is a safety net. If a skill isn't found in your map for some reason, it defaults to adding 0 instead of breaking your application
      // => sum + ...: This adds the skill's money value to the running total, updates it, and moves to the next item until the list ends
      return _baseSalary + (_yearsOfExperience * 2000) + bonus;
    }

    void printDetails() {
      print('Employee: $name, Base Salary: \$${baseSalary}');
      print('Each year of experience adds: $yearsOfExperience yrs\nSkills: ${skills.map((s) => s.name).join(', ')}');
      // s.name) to loop through a list of skills and clean them up into pure text names, and then you use .join(', ') to glue those text names together into a single, comma-separated sentence
      // for s.name it turn to FLUTTER, DART, OTHER
      // using .map() is to loop and s is skill ( acts as a loop that cycles through each item in the employee's skills list)
      print('Address: ${address.street}, ${address.city}');
      print('Total Salary: \$${calculateSalary()}\n');
    }
  }

  class Address { 
    final String _street;
    final String _city;
    final String _zipCode;

    Address(this._street, this._city, this._zipCode);
    String get street => _street;
    String get city => _city;
    String get zipCode => _zipCode;
  }

  void main() {
    var address1 = Address('123 Main St', 'City A', '12345');
    var emp1 = Employee('Sokea', 40000, 3, [Skill.DART], address1);
    emp1.printDetails();

    var address2 = Address('456 Elm St', 'City B', '67890');
    var emp2 = Employee.mobileDeveloper('Ronan', 45000, 5, address2);
    emp2.printDetails();
  }