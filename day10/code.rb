# frozen_string_literal: true

adapters = File.read(File.join(__dir__, 'input.txt')).split("\n").map(&:to_i)
adapters.sort!

# add power outlet jolt
adapters.prepend 0
# add built-in jolt
adapters.append adapters.last + 3

ones = 0
threes = 0
adapters_size = adapters.size

adapters.each_with_index do |adapter, index|
  next if (index + 1) == adapters_size

  case (adapters[index + 1] - adapter)
  when 1
    ones += 1
  when 3
    threes += 1
  end
end

puts "#{ones} × #{threes} = #{ones * threes}"
