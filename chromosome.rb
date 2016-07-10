class Chromosome
	attr_accessor :value, :variable_name

	def initialize random_generator, variable_name, min, max
		@min                  = min
		@max 				          = max
		@random_generator     = random_generator

		self.value 			      = @random_generator.rand(@max - @min)
		self.variable_name 	  = variable_name

    @mutation_chance      = 0.5
    @mutation_variance    = 0.1
    @variance_size        = (@max - @min) * @mutation_variance
	end

	def mutate!
    if (@mutation_chance * 100) >= @random_generator.rand(100)
      old_value = value

      random_value = @random_generator.rand(@variance_size*2)
      change = (random_value - @variance_size).to_i
    
      self.value += change
      
      self.value = @max if value > @max
      self.value = @min if value < @min 

      puts "Mutate chromsome #{ variable_name } from #{ old_value } to #{ value } (#{ change })"
    end

    self
	end

	def to_s
		"#{ variable_name }: #{ value }"
	end
end