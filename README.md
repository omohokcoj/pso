#PSO
This is a Naive implemention of the PSO algorithm.

####Default values:
```ruby
c1          = random() * 2 # where random: 0 <= x <= 1
c2          = 4 - c1
w           = 0.01
range       = -100 < x < 100
partecles   = 20
generations = 20_000
```

####Example:
```ruby
dimension     = 1
num_particles = 5
range         = [-10, 10]
generations   = 100

optimizer = Pso.new(dimension, num_particles, range, generations) 
solution, particle = optimizer.opt { |x| x**2 }
```

=> [5.151122913755718e-47, {:velocity=>[-2.1149050186198952e-24], :position=>[7.192420701346887e-24], :best=>[7.177132375646779e-24], :fitness=>5.151122913755718e-47}]
