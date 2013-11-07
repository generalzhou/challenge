 require 'rspec'
 require '../prime'

 describe Prime  do
  describe "get_primes" do
    
    let(:generator) { Prime.new }

    it 'raises an argument error if n is less than 1' do
      expect { generator.get_primes(1.1) }.to raise_error(ArgumentError, 'n must be a positive integer')
    end

    it 'raises an argument error if n is not an integer' do
      expect { generator.get_primes(1.1) }.to raise_error(ArgumentError, 'n must be a positive integer')
    end

    it 'returns an array of prime numbers' do
      known_primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
      generator.get_primes(10).should == known_primes
    end

    it 'should only generate new primes if needed' do
      generator.get_primes(10)
      generator.should_receive(:is_prime).exactly(1).times
      generator.get_primes(5)
    end
  end
 end