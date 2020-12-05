# frozen_string_literal: true

require 'set'

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

highest_id = passes.map(&:id).max

puts 'Part 1: highest seat id'
puts highest_id
puts 'Part 2: my seat id'

ids = passes.map(&:id).to_set
seat_without_successor = ids.sort.reject { |id| ids.member?(id.succ) }.first
puts seat_without_successor + 1
