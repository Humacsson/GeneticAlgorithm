require_relative 'organism'
require_relative 'chromosome'

class WingProblem < Organism
	include Comparable

	attr_accessor :var_a, :var_b, :var_c, :var_d

	def initialize random_generator
		@random_generator = random_generator

		self.chromosomes = [
			Chromosome.new(@random_generator, 'var_a', 0, 63),
			Chromosome.new(@random_generator, 'var_b', 0, 63),
			Chromosome.new(@random_generator, 'var_c', 0, 63),
			Chromosome.new(@random_generator, 'var_d', 0, 63)
		]

		from_chromosomes!
	end

	def fitness
		((var_a - var_b)^2) + ((var_c - var_d)^2) - ((var_a - 30)^3) - ((var_c - 40) ^ 3)
	end

	def to_s
		super + ", A: #{ var_a }, B: #{ var_b }, C: #{ var_c }, D: #{ var_d }"
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