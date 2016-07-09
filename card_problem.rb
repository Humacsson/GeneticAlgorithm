require_relative 'organism'

class CardProblem < Organism
	include Comparable

	SUM_TARGET 			= 36
	PRODUCT_TARGET 		= 360
	CARDS 				= (1..15).to_a

	attr_accessor 	:sum, 		:sum_pile,
					:product, 	:product_pile

	def fitness
		sum_fitness 	= sum.to_f 		/ SUM_TARGET
		product_fitness = product.to_f 	/ PRODUCT_TARGET

		sum_fitness 	= 1 if sum_fitness.zero?
		product_fitness = 1 if product_fitness.zero?

		((sum_fitness * product_fitness) - 1).abs
	end

	def self.from_chromosomes chromosomes
		instance = CardProblem.new
		instance.chromosomes 		= chromosomes
		instance.sum_pile 			= []
		instance.product_pile 		= []

		instance.chromosomes.each_with_index do |chromosome, index|
			if chromosome.zero?
				instance.sum_pile 		<< CARDS[index]
			else
				instance.product_pile 	<< CARDS[index]
			end
		end

		instance.sum 		= instance.sum_pile		.inject(0) { |sum, value| sum + value }
		instance.product 	= instance.product_pile	.inject(1) { |sum, value| sum * value }
	
		instance
	end

	def to_s
		super + ", Sum: #{ sum }, Product: #{ product }, Sum Pile: #{ sum_pile.inspect }, Product Pile: #{ product_pile.inspect }"
	end

	def <=> (other)
		self.fitness <=> other.fitness
  	end

	private

	def chromosome_length
		CARDS.length
	end

	def self.chromosome_length
		CARDS.length
	end
end
