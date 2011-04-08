	
class Pso
	def initialize( numParticles = 20, dimension, min, max )
		@c1 = rand * 2
		@c2 = 4 - c1

		@range = { :min => min, :max => max }

		@particles 	= []
		@velocity 	= []
		spawnParticles(numParticles)
	end

	def opt(&fit, generations = 20_000)
		
	end

	private

	def update
		
	end

	def spawnParticles( numPartices )
		span = @max - @min

		numParticles.times do
			particle = [ span ] * dimension
			velocity = [ 0 ] * dimension

			velocity.map do |v|
				(span *0.1) * (rand - 0.5)
			end

			particle.map do |p|
				@min + p * rand
			end

			@particles << particle
		end
	end
end
