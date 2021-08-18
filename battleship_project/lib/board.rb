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

  # def []==(position, check)
  #    @grid[position[0]][position[1]] == check
  # end

  def num_ships
    count = @grid.flatten.count { |ele| ele == :S}
  end

  #--------------Part 2------------

  def attack (position)
    if self[position]==:S
      p 'you sunk my battleship!'
      self[position]=:H 
      return true
    else
      self[position]=:X
      return false
    end
  end

  def place_random_ships
    maxShips = @size *0.25
    n=Math.sqrt(@size)
    
    #debugger
    (1..maxShips).each do 
      #debugger
      x = rand(1..n)
      y = rand(1..n)

      if self[[x,y]] != :S
       self[[x, y]] = :S
      else
        while(self[[x, y]] == :S)
          x = rand(1..n)
          y = rand(1..n)
        end
        self[[x, y]] = :S
      end

    end

  end

  def hidden_ships_grid
    res_grid = []
    

    @grid.each do |arr|
      sub_arr = []
      arr.each do |ele|
        if ele == :S
          sub_arr << :N
        else
          sub_arr << ele
        end
      end
      res_grid << sub_arr
    end

    res_grid
  end

  def self.print_grid (grid)
    grid.each do |row|
      puts row.join(" ")
    
    end
  end

  def cheat
    Board.print_grid(@grid)
  end
  
  def print
    Board.print_grid(self.hidden_ships_grid)
  end



end #end Board Class
