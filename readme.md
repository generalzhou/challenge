##Prime Table Generator

This program will generate prime numers, along with the multiplication table for them. One example has been provided for 10 prime numbers. To print it to console, just run

````ruby ten_prime_table.rb````

To generate a list of n primes, 

    require_relative 'prime'
    generator = Prime.new
    generator.get_primes(n)

To generate a table of n x n primes,

    require_relative 'prime_table'
    table_generator = PrimeTable.new(n)
    table_generator.print_table

To run tests (make sure you have rspec 2.14.4 installed):

    rspec spec/prime_spec.rb
    rspec spec/prime_table_spec.rb
