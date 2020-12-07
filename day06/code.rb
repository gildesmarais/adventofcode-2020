# frozen_string_literal: true

p File.read(File.join(__dir__, 'input.txt'))
      .split("\n\n")
      .then { |group_answers|
    group_answers.flat_map { |group| group.split("\n").join.split('').uniq }
  }.size
