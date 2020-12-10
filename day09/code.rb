# frozen_string_literal: true

require 'set'

class XMAS
  def initialize(numbers = [], preamble_length: 25)
    @numbers = numbers
    @numbers_size = @numbers.size
    @preamble_length = preamble_length
  end

  def check
    window_current_index = 0
    number_index = @preamble_length

    loop do
      window = @numbers[window_current_index..number_index - 1]
      number = @numbers[number_index]

      raise "Number #{number} is invalid" unless valid?(number, window)

      number_index += 1
      window_current_index += 1

      break if number_index > @numbers_size
    end
  end

  private

  def valid?(number, window)
    possible_numbers = Set.new

    window.each do |window_number|
      window.each do |other_window_number|
        possible_numbers << (window_number + other_window_number) unless window_number == other_window_number
      end
    end

    puts number, possible_numbers.inspect
    possible_numbers.member? number
  end
end

XMAS.new(File.read(File.join(__dir__, 'input.txt')).split("\n").map(&:to_i), preamble_length: 25).check
