class Pso
	attr_accessor :particles
	def initialize( dimension, numParticles = 20, range=[-100,100], generations=20_000 )
		@c1           = rand * 2
		@c2           = 4 - @c1
    @w            = 0.01
		@range        = generations
    @dimension    = dimension
		@range        = { :min => range[0], :max => range[1]}
    @generations  = generations
		@particles 		= []
		spawnParticles(dimension, numParticles)
	end

	def opt(&fitness_func)
    @best_particle = @particles.first
    minimum       = fitness_func.call( *@particles.first[:position] )
  
    @generations.times do 
      @particles.map! do |p|
        p_new = update( p )
        p_fitness = fitness_func.call( *p_new[:position] )
        if p_fitness < minimum
          minimum = p_fitness
          @best_particle = p_new
        end
        if p_fitness < p_new[:fitness]
          p_new[:fitness] = p_fitness
          p_new[:best]    = p_new[:position]
        end
        p_new
      end
    end  
  
    return minimum, @best_particle
	end

	private

	def update( particle )
    velocities = particle[:velocity]
    pos  = particle[:position]
    local_best = particle[:best]
 
    new_velo = update_velocity( velocities, local_best, pos ) 
    pos  = pos.zip(new_velo).map{ |p,v| calc_new_pos( p,v ) }
    particle[:position] = pos
    particle[:velocity] = new_velo
    particle
	end

  def calc_new_pos( position, velocity )
    new_position = position + velocity
    if new_position > @range[:max]
      new_position = @range[:max]
    elsif new_position < @range[:min]
      new_position = @range[:min]
    end
    new_position
  end

  def update_velocity( velo, local_best, pos)
    @dimension.times.each do |idx|
      velo[idx] = @w * velo[idx] + 
                        @c1 * Random.rand() * ( local_best[idx]                - pos[idx]) +
                        @c2 * Random.rand() * ( @best_particle[:position][idx] - pos[idx] )
    end
    velo
  end

	def spawnParticles( dimension, numParticles )
		span = @range[:max] - @range[:min]
		@particles ||= []
		numParticles.times do
			velocity = ([span]*dimension).map {|x| (Random.rand() - 0.5)*x }
			position = ([span]*dimension).map {|x| Random.rand()*x }

			@particles << { velocity: velocity,
			       			    position: position,
                          best: position,
                       fitness: 1.0 / 0 }
		end
	end
end
