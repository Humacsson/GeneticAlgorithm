require_relative 'card_problem'
require_relative 'wing_problem'

class Evolution
	GENERATION_ORGANISM_COUNT = 100

	def self.main
		random_generator = Random.new

		generation_count = 0
		mother = nil
		father = nil

		generation = build_generation WingProblem, random_generator

		while generation_count <= 10
			puts ""
			puts "Generation ##{ generation_count }"
			puts "-----------------------------------"
			puts "Mother: #{ mother.to_s }"
			puts "Father: #{ father.to_s }"
			puts ""
			#puts "Children:"
			#generation.each do |child|
			#puts "\t #{ child.to_s }"
			#end
			
			mother = generation[0]
			father = generation[1]

			generation = build_generation WingProblem, random_generator, mother, father
			generation_count += 1
		end
	end		

	def self.build_generation organism_class, random_generator, mother = nil, father = nil
		generation = []
		
		if mother.nil? && father.nil?
			GENERATION_ORGANISM_COUNT.times do
				generation << organism_class.new(random_generator)
			end
		else
			(GENERATION_ORGANISM_COUNT/2).times do
				generation += organism_class.crossover(random_generator, mother, father, Organism::CrossoverTypes::ONE_POINT)
			end
		end

		generation.sort!		

		generation
	end
end

Evolution.main