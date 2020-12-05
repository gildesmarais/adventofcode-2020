# frozen_string_literal: true

class Code
  def initialize(input_path)
    @lines = File.read(input_path).split("\n")
  end

  def passwords
    @lines.keep_if do |line|
      policy, password = line.split(': ')
      countings, character = policy.split
      min, max = countings.split('-').map(&:to_i)

      valid?(password, character, min, max)
    end
  end

  private

  def valid?(password, character, min, max)
    count = password.count(character)
    count >= min && count <= max
  end
end

p Code.new(File.join(__dir__, 'input.txt')).passwords.count
