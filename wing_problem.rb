require_relative 'organism'

class WingProblem < Organism
	include Comparable

	attr_accessor 	:var_a, 
					:var_b , 
					:var_c,
					:var_d

	def fitness
		((var_a - var_b)^2) + ((var_c - var_d)^2) - ((var_a - 30)^3) - ((var_c - 40) ^ 3)
	end

	def self.from_chromosomes chromosomes
		instance = WingProblem.new
		instance.chromosomes 		= chromosomes

		instance.var_a = chromosomes[0..5].join.to_i(2)
		instance.var_b = chromosomes[6..11].join.to_i(2)
		instance.var_c = chromosomes[12..17].join.to_i(2)
		instance.var_d = chromosomes[18..24].join.to_i(2)
	
		instance
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