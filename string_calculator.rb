def add(number_strings)
  return nil unless number_strings.is_a?(Array)

  number_strings.map do |number_string|
    add_string(number_string)
  end
end

def add_string(string)
  return nil unless string.is_a?(String)
  return 0 if string.end_with?("\n")

  delimeter = get_delimeter(string)

  numbers = string.gsub(/(\n)(?!\z)/, delimeter).split(delimeter).map do |number|
    number.to_i
  end

  raise "negative numbers not allowed #{numbers.select { |number| number < 0 }.join(', ')}" if numbers.any? { |number| number < 0 }

  numbers.sum
end

def get_delimeter(string)
  return string.split("\n").first[2..-1] if string.start_with?('//')

  ','
end
