require_relative "code"
require "byebug"

class Mastermind

  def initialize (lngth)
    # arr = []
    # (0...lngth).each { |i| arr<<Code.POSSIBLE_PEGS.keys.sample}
    
    @secret_code = Code.random(lngth)
  end

  def print_matches (code)
    p @secret_code.num_exact_matches (code)
    p @secret_code.num_near_matches (code)
  end

  def ask_user_for_guess
    p 'Enter a code'
    input = gets.chomp
    code= Code.from_string(input)
    
    p @secret_code.num_exact_matches (code)
    p @secret_code.num_near_matches (code)
    code==@secret_code
  end


end # end Mastermind Class

