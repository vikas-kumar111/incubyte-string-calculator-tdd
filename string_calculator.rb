def add(number_strings)
  return nil unless number_strings.is_a?(Array)

  number_strings.map do |number_string|
    add_string(number_string)
  end
end

def add_string(string)
  return nil unless string.is_a?(String)

  string.split(',').map(&:to_i).sum
end
