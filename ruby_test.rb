class Man
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
  
  def greet
    p "Hi,my name is #{name}. Nice to meet you."  
  end
end

mike = Man.new("mike")
mike.greet