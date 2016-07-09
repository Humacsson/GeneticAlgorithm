require_relative 'card_problem'
require_relative 'wing_problem'

class Evolution
	GENERATION_ORGANISM_COUNT = 100

	def self.main
		random_generator = Random.new

		generation_count = 0
		mother = nil
		father = nil

		while generation_count <= 10000
			generation = build_generation CardProblem, random_generator, mother, father
			
			mother = generation[0]
			father = generation[1]

			generation_count += 1

			p "Generation ##{ generation_count }"
			p "Mother: #{ mother.to_s }"
			p "Father: #{ father.to_s }"
		end
	end		

	def self.build_generation organism_class, random_generator, mother = nil, father = nil
		generation = []
		
		if mother.nil? && father.nil?
			GENERATION_ORGANISM_COUNT.times do
				generation << organism_class.random(random_generator)
			end
		else
			(GENERATION_ORGANISM_COUNT/2).times do
				generation += organism_class.crossover(random_generator, mother, father)
			end
		end

		generation.sort!

		generation
	end
end

Evolution.main