class Chromosome
	attr_accessor :value, :variable_name

	def initialize random_generator, variable_name, min, max
		@min 				= min
		@max 				= max
		@random_generator 	= random_generator

		self.value 			= random_value
		self.variable_name 	= variable_name
	end

	def mutate!
		self.value = random_value
	end

	def to_s
		"#{ variable_name }: #{ value }"
	end

	private

	def random_value
		# might produce an off-by-one error(max)
		delta_value = @random_generator.rand(@max - @min)

		@min + delta_value
	end
end