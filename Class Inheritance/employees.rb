class Employee

  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    salary * multiplier
  end
end

class Manager < Employee
  attr_reader :employees

  def initialize(name, title, salary, boss = nil, employees = nil)
    super(name, title, salary, boss)
    @employees = []
  end

  def bonus(multiplier)
    employees.each do |associate|
      if associate.is_a?(Manager)
        salaries << associate.bonus(multiplier)
      else
        salaries << associate.salary
      end
    end

    salaries.reduce(:+)
  end

  def assign_employees(employee)
    #assign employee to Manager
    @employees << employee
    employee.boss.employees.delete(employee) unless employee.boss.nil?
    employee.boss = self
  end
end

ned = Manager.new("Ned", "Founder", 1_000_000)
darren = Manager.new("Darren", "TA Manager", 78_000)
shawna = Employee.new("Shawna", "TA", 12_000)
david = Employee.new("David", "TA", 10_000)
