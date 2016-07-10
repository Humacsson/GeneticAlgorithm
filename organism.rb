
class Organism
	attr_accessor :chromosomes

	def initialize random_generator
		@random_generator = random_generator
	end
	
	def fitness
		fail NotImplementedError
	end

	def self.from_chromosomes random_generator, chromosomes
		instance = new random_generator

		instance.chromosomes = chromosomes
		instance.from_chromosomes!

		instance
	end

	def from_chromosomes!
		chromosomes.each do |chromosome| 
			send("#{ chromosome.variable_name }=", chromosome.value)
		end
	end

	def mutate chromosomes
		mutation_index = @random_generator.rand(chromosomes.length)

		chromosomes[mutation_index].mutate!

		chromosomes
	end

	def mutate!
		self.chromosomes = mutate chromosomes

		self
	end

	module CrossoverTypes 
		ONE_POINT 	= 1
	end

	def self.crossover random_generator, mother, father, crossover_type
		if crossover_type == CrossoverTypes::ONE_POINT
			one_point_crossover random_generator, mother, father
		end
	end

	def to_s
		"Chromosomes: '[ #{ chromosomes.join(', ') } ] ', Fitness: #{ fitness }"
	end

	private

	def self.one_point_crossover random_generator, mother, father
		crossover_point = random_generator.rand(mother.chromosomes.length)

		children = []
		children << father.chromosomes[0..crossover_point] + mother.chromosomes[crossover_point+1..chromosome_length-1]
		children << mother.chromosomes[0..crossover_point] + father.chromosomes[crossover_point+1..chromosome_length-1]

		children.map! {|child| from_chromosomes(random_generator, child).mutate! }

		children
	end
end
