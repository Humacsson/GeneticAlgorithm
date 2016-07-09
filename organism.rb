
class Organism
	attr_accessor :chromosomes

	def mutate chromosomes, random_generator
		mutation_index = random_generator.rand(chromosome_length)
		
		chromosomes[mutation_index] = chromosomes[mutation_index].zero? ? 1 : 0

		chromosomes
	end

	def mutate! random_generator
		self.chromosomes = mutate chromosomes, random_generator

		self
	end

	def fitness
		fail NotImplementedError
	end

	def self.from_chromosomes chromosomes
		fail NotImplementedError
	end

	def self.crossover random_generator, mother, father
		crossover_point 			= random_generator.rand(chromosome_length)

		children = []
		children << father.chromosomes[0..crossover_point] + mother.chromosomes[crossover_point+1..chromosome_length-1]
		children << mother.chromosomes[0..crossover_point] + father.chromosomes[crossover_point+1..chromosome_length-1]

		children.map! {|child| from_chromosomes(child).mutate!(random_generator) }

		children
	end

	def self.random random_generator
		chromosomes = random_chromosomes random_generator

		from_chromosomes chromosomes
	end

	private

	def self.random_chromosomes random_generator
		chromosomes = []

		chromosome_length.times do
			chromosomes << random_generator.rand(2)
		end

		chromosomes
	end

	def to_s
		"Chromosome: #{ chromosomes.join }, Fitness: #{ fitness }"
	end

	protected

	def self.chromosome_length
		fail NotImplementedError
	end
end
