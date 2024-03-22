def add(number_strings)
  number_strings.map do |number_string|
    number_string.split(',').map(&:to_i).sum
  end
end
