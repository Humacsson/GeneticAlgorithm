require "minitest/autorun"

require_relative 'organism'

class OrganismTest 
	class Fitness < Minitest::Test
		def test_calculates_correct_fitness
			organism = Organism.new(Random.new)
			assert_equal 1, organism.fitness
		end
	end

	class Crossover < Minitest::Test
	end
end