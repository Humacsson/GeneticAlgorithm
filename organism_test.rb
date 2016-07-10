
require 'minitest/autorun'
require_relative 'organism'

class OrganismTest
  class FromChromosomes  < Minitest::Test
    def test_updates_vars
      random_generator = Random.new)

        o = WingProblem.new(random_generator)
        o.chromosomes = [
          Chromosome.new(random_generator)
        ]

        o.from_chromosomes!

        assert_equal nil, o.

    end
  end
end