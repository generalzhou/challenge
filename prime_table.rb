require './prime'

class PrimeTable
  attr_reader :primes, :primes_generator
  attr_accessor :n

  def initialize(n)
    @n = n
    @primes_generator = Prime.new
    @primes = primes_generator.get_primes(n)
  end

  def print_table
    table = generate_table
    cell_size = largest_cell(table) + 1
    table.each do |row|
      row_string = row.map { |cell| padded_cell(cell, cell_size) }.join(' | ') + ' |'
      puts row_string
      puts row_divider(row_string.size)
    end
  end

  private

  def generate_table
    @primes = @primes.size == n ? @primes : primes_generator.get_primes(n)
    products = calculate_prime_products
    table_with_columns = add_columns_to_table(products)
    add_first_row_to_table(table_with_columns)
  end

  def add_first_row_to_table(table_with_columns)
    row_1 = [nil] + primes
    [row_1] + table_with_columns
  end

  def add_columns_to_table(prime_products)
    i = 0
    prime_products.map do |row|
      i += 1
      [primes[i - 1]] + row
    end
  end

  def calculate_prime_products
    prime_products = n.times.map do |row_index|
      n.times.map do |column_index|
        primes[row_index] * primes[column_index]
      end
    end
  end

  def row_divider(size)
    size.times.map { '-' }.join
  end

  def padded_cell(number, cell_size)
    formatted_number = pretty_print_number(number)
    formatted_number.reverse!
    (cell_size - formatted_number.size).times {formatted_number << ' '}
    formatted_number.reverse
  end

  def largest_cell(table)
    largest_number = table[table.size - 1][table.size - 1]
    pretty_print_number(largest_number).size
  end

  def pretty_print_number(number)
    number.to_s.reverse.split('').each_slice(3).map(&:join).join(',').reverse
  end
end
