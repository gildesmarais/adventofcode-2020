# frozen_string_literal: true

required =  %w[byr iyr eyr hgt hcl ecl pid]
# cid (Country ID) = optional

passports = File.read(File.join(__dir__, 'input.txt')).split("\n\n")
                .map { |lines| lines.split("\n").join(' ') }
                .map do |line|
  line.split.map { |pairs| pairs.split(':') }.to_h
end

passports.keep_if { |passport| (required - passport.keys).empty? }

puts passports.count
