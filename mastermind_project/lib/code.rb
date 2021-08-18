require "byebug"

class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs #array of chars of pegs

  def self.valid_pegs? (arr) 
    arr.all? do |ele|
      POSSIBLE_PEGS.has_key?(ele.upcase)

    end
  
  end

  def initialize (pegs) #array of chars of pegs
    if Code.valid_pegs?(pegs)
      pegs.map! {|ele| ele.upcase}
      @pegs = pegs
    else
      raise error
    end
  end

  def self.random(length)
    arr = []
    (1..length).each {|i| arr<<POSSIBLE_PEGS.keys.sample}
    Code.new(arr)
  end

  def self.from_string (pegs)
    arr = []
    (0...pegs.length).each {|i| arr << pegs[i].upcase}
    Code.new(arr)
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  #---------------Part 2--------------

  def num_exact_matches(code)
    count = 0
    (0...@pegs.length).each do |i| 
      if @pegs[i] ==code.pegs[i]
        count +=1
      end
    end

    count
  end

  def num_near_matches(code)
    count = 0
    answer = []
    guessCode = []
    code.pegs.each  {|cpeg| guessCode<<cpeg}
    @pegs.each {|apeg| answer<<apeg}

    (0...answer.length).each do |idx|
      if answer[idx] == guessCode[idx] 
        answer[idx] = nil
        guessCode[idx] = "0"
      end
    end


    (0...answer.length).each do |i|
      (0...guessCode.length).each do |j|
        #debugger
        if answer[i] == guessCode[j] && i!=j
           answer[i] = nil
           guessCode[j] = "0"
           count +=1
        elsif answer[i] == guessCode[j] 
           answer[i] = nil
           guessCode[j] = "0"
        end
      end
    end
#debugger

    # if @pegs == code.pegs
    #   return 0
    # end

    # correct_count = 0
    # POSSIBLE_PEGS.each_key do |color| #for each color
    #   cCount = code.pegs.count(color) #count that color in 'code'
    #   pCount = @pegs.count(color)     #count that color in instanced class
    #         #debugger
    #   correct_count += (pCount - cCount).abs
    # end

    # correct_count-=num_exact_matches(code)

    # if correct_count<0
    #   return 0
    # end
    #           #debugger
    count
  end

  
def ==(code)
  code.pegs ==@pegs
end

end # end of Code class {R G B Y} 1012=4
