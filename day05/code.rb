# frozen_string_literal: true

class BoardingPass
  SEATS_PER_ROW = 8

  attr_reader :code

  def initialize(code)
    @code = code
  end

  def id
    row * SEATS_PER_ROW + column
  end

  def row
    code[0..7].gsub('F', '0').gsub('B', '1').to_i(2)
  end

  def column
    code[7..].gsub('L', '0').gsub('R', '1').to_i(2)
  end
end

passes = File.read(File.join(__dir__, 'input.txt'))
             .split("\n")
             .map { |code| BoardingPass.new code }

puts passes.map(&:id).max
