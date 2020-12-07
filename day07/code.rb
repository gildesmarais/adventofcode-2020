# frozen_string_literal: true

require 'bundler'
Bundler.require(:default, :day07, :development)

require 'rgl/adjacency'
require 'rgl/traversal'
require 'set'

class Rule
  attr_reader :outside, :insides, :line

  def initialize(line)
    @line = line
    @outside, insides = line.gsub(/(bag.?)/, '').split('  contain ')

    @insides = insides.gsub(' .', '').gsub(',', '').split('  ')
                      .map do |inside|
      next if inside == 'no other'

      amount, color = inside.match(/(\d) (\w* \w*)/)[1..2]

      [color.to_s, amount.to_s.to_i]
    end
                      .compact
                      .to_h
  end

  def graph
    insides.map(&:first).flat_map { |inside| [color, inside] }
  end

  alias color outside

  def self.from_file(file_path)
    File.read(file_path).split("\n").map { |line| Rule.new(line) }
  end
end

def recursive_adjacent(graph, start_vertex, bags = Set.new)
  graph.adjacent_vertices(start_vertex).each do |vertex|
    bags.add vertex
    recursive_adjacent(graph, vertex, bags)
  end

  bags
end

rules = Rule.from_file File.join(__dir__, 'input.txt')
dg = RGL::DirectedAdjacencyGraph[*rules.flat_map(&:graph)]
p recursive_adjacent(dg.reverse, 'shiny gold').count
