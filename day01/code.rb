# frozen_string_literal: true

require 'set'

DESIRED = 2020

numbers = File.read(File.join(__dir__, 'input.txt'))
              .split("\n")
              .map(&:to_i)
              .to_set

numbers.each do |number|
  other = DESIRED - number
  p(number * other) and exit if numbers.member?(other)
end
