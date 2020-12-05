# frozen_string_literal: true

TREE = '#'
MOVE_RIGHT_BY = 3

grid = File.read(File.join(__dir__, 'input.txt'))
           .split("\n")
           .map { |row| row.split('') }

rows = grid.count
columns = grid.first.count
path = []

rows.times do |row_number|
  path << if row_number.zero?
            [0, 0]
          else
            [row_number, row_number * MOVE_RIGHT_BY]
          end
end

trees = path.select { |coordinates| grid[coordinates.first % rows][coordinates.last % columns] == TREE }

puts "Path: #{path}"
puts "Trees: #{trees}"
puts "Trees Count: #{trees.count}"
