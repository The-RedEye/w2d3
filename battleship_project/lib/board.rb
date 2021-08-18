class Board

  attr_reader :size
  
  def initialize (n)
   
    @grid = Array.new(n) {Array.new(n, :N)}
    @size = n *n

  end

  def [] (arr)
    @grid[arr[0]][arr[1]]
  end

  def []= (position, val)
    @grid[position[0]][position[1]] = val
  end

  def num_ships
    count = @grid.flatten.count { |ele| ele == :S}
  end
  


end #end Board Class
