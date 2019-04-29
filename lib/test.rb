class Dog
  attr-accessor :name, :color, :age
  def initialize(name, color, age)
    @name = name
    @color = color 
    @age = age
  end
end

dog1 = Dog.new('tommy', 'brown', 3)
dog2 = Dog.new('foxy', 'white', 2)
