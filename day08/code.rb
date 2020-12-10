# frozen_string_literal: true

require 'set'

class Code
  def initialize(file_path)
    @index = 0
    @accumulator = 0
    @visited = Set.new

    @commands = File.read(file_path).split("\n").map do |line|
      cmd, number = line.split

      [cmd.to_sym, number.to_i]
    end
  end

  def acc(number)
    @accumulator += number
    @index += 1
    nil
  end

  def nop(_arg)
    @index += 1
    nil
  end

  def jmp(number)
    @index += number
    nil
  end

  def process
    loop do
      raise "Prevented loop at #{@index}, accumulator is #{@accumulator}" if @visited.include? @index

      @visited << @index
      public_send(*@commands[@index])
    end
  end
end

Code.new(File.join(__dir__, 'input.txt')).process
