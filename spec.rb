require './pso'
describe Pso do
  before(:each) do
	  @dimension = 1
	  @numParticles = 20
    @range = [-100, 100]
    @generations = 100
    @pso = Pso.new(@dimension, @numParticles, @range, @generations )
  end

  context "init" do
    it "should create correct number of particles" do
	    @pso.particles.count.should == @numParticles
    end

	  it "should create particles with the correct dimension" do
		  @pso.particles.each do |p|
			  p[:position].length.should == @dimension
			  p[:velocity].length.should == @dimension
  		end
	  end
  end
  

  context "find a minimum of  x**2 " do
    it "should find the local minimum for x**2" do
      sol, particle = @pso.opt{ |x| x**2 }
      sol.round(2).should == 0.0
    end
  end
end
