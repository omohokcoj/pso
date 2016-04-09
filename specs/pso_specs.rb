require 'pso'

describe Pso do
  let!(:dimension) { 1 }
  let!(:num_particles) { 20 }
  let!(:range) { [-100, 100] }
  let!(:generations) { 100 }

  let(:pso) { Pso.new(dimension, num_particles, range, generations) }

  context 'init' do
    it 'should create correct number of particles' do
      expect(pso.particles.count).to eq num_particles
    end

    it 'should create particles with the correct dimension' do
      pso.particles.each do |p|
        expect(p[:position].length).to eq dimension
        expect(p[:velocity].length).to eq dimension
      end
    end
  end

  context 'find a minimum of x**2 + 2' do
    it 'should find the local minimum for x**2 + 2' do
      sol, = pso.opt { |x| x**2 + 2 }
      expect(sol.round(2)).to eq 2.0
    end
  end
end
