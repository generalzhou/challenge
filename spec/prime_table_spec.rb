 require 'rspec'
 require_relative '../prime_table'

describe PrimeTable  do
  describe '#new' do
    it 'should generate the right number of primes' do
      table = PrimeTable.new(10)
      table.primes.size.should == 10
    end
  end

  describe '#print_table' do

    let(:output_for_2_primes) {
      ['   |  2 |  3 |', 
       '--------------',
       ' 2 |  4 |  6 |',
       '--------------',
       ' 3 |  6 |  9 |',
       '--------------']
    }

    let(:output_for_1_prime) {
      ['   |  2 |', 
       '---------',
       ' 2 |  4 |',
       '---------']
    }


    it 'should print a correctly formatted table' do
      table = PrimeTable.new(2)
      output_for_2_primes.each do |row|
        STDOUT.should_receive(:puts).with(row)
      end                  
      table.print_table
    end

    it 'should change output when n is changed' do
      table = PrimeTable.new(2)

      output_for_2_primes.each do |row|
        STDOUT.should_receive(:puts).with(row)
      end                  

      table.print_table

      output_for_1_prime.each do |row|
        STDOUT.should_receive(:puts).with(row)
      end                  

      table.n = 1
      table.print_table
    end

  end

end