class Employee

  attr_accessor :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee

  def initialize(name, title, salary, boss)
    super
    @employees = []
  end

  def add_employee(employee)
    @employees << employee
  end

  def bonus(multiplier)
    bonus_val = 0
    @employees.each do |employee|
      bonus_val += employee.salary
    end
    bonus_val * multiplier
  end
end

david = Employee.new("david", "TA", 10000, "darren")
shawna = Employee.new("shawna", "TA", 12000, "darren")
darren = Manager.new("darren", "TA Manager", 78000, "ned")
ned = Manager.new("ned", "Founder", 1000000, nil)
darren.add_employee(david)
darren.add_employee(shawna)
ned.add_employee(david)
ned.add_employee(shawna)
ned.add_employee(darren)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3)
p ned
p darren
p shawna
p david
