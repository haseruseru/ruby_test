#Procオブジェクト 名前のない関数-------------------------
# -> (x,y) {...}
#-> (x,y,z:nil) {...}
# lambda{|x,y,z:nil|...}
# Proc.new{|x,y,z:nil|...} --制限あり
# proc{ |x,y,z:nil|...}　--制限あり

p = -> (n) do
  n +=1 if n.odd?
  n **2
end

puts p.call(7)

#活用例

class Robot
  attr_reader :x,:y
  attr_writer :handler
  
  def initialize
    @x=0
    @y=0
    @handler = -> {move(1,0)}
  end
  
  def walk
    @handler.call
    puts "(x,y) = (#{@x},#{@y})"
  end
  
  def move(d1,d2)
    @x += d1
    @y += d2
  end
end

r = Robot.new
r.walk
r.walk
r.handler = -> {r.move(0,1)}
r.walk
r.handler = -> {r.x <= 2 ? r.move(1,1) : r.move(-1,1)}
r.walk
r.walk

=begin
#ブロック要素-------------------------------------

class Robot
  attr_reader :x,:y
  def initialize
    @x=0
    @y=0
    
  end
  
  def job
    x0,y0 = x, y
    yield(self)
    puts "(#{x0},#{y0}) => (#{x},#{y})"
  end
  
  def move(d1,d2)
    @x += d1
    @y += d2
  end
end

robot=Robot.new

robot.job do |r|
  r.move(1,0)
  r.move(1,1)
  r.move(0,-3)
end
#---------------------------------------------
=end