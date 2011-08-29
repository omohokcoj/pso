class Pso
	def initialize( dimension, numParticles = 20, range=[0,100], generations=20_000 )
		@c1 = rand * 2
		@c2 = 4 - @c1

		@range = generations

		@range= { :min => range[0], :max => range[1]}

		@particles 		= []
		spawnParticles(dimension, numParticles)
	end

	def opt(&fitness_func)
	end

	private

	def update
		
	end

	def spawnParticles( dimension, numPartices )
		span = @range[:max] - @range[:min]
		@particles ||= []
		numPartices.times do
			velocity = ([span]*dimension).map {|x| (Random.rand() - 0.5)*x }
			position = ([span]*dimension).map {|x| Random.rand()*x }

			@particles << { velocity: velocity,
						    position: position }
		end
	end
end
