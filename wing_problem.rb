require_relative 'organism'
require_relative 'chromosome'

class WingProblem < Organism
	include Comparable

	attr_accessor :_A, :_B, :_C, :_D

	def initialize random_generator
		@random_generator = random_generator

		self.chromosomes = [
			Chromosome.new(@random_generator, '_A', 0, 63),
			Chromosome.new(@random_generator, '_B', 0, 63),
			Chromosome.new(@random_generator, '_C', 0, 63),
			Chromosome.new(@random_generator, '_D', 0, 63)
		]

		from_chromosomes!
	end

	def fitness
		((_A - _B)^2) + ((_C - _D)^2) - ((_A - 30)^3) - ((_C - 40) ^ 3)
	end

	def to_s
		super + ", A: #{ _A }, B: #{ _B }, C: #{ _C }, D: #{ _D }"
	end

	def <=> (other)
   		other.fitness <=> self.fitness
  	end

	private

	def chromosome_length
		24
	end

	def self.chromosome_length
		24
	end
end