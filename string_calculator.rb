def add(number_strings)
  return nil unless number_strings.is_a?(Array)

  number_strings.map do |number_string|
    if number_string.is_a?(String)
      number_string.split(',').map(&:to_i).sum
    else
      nil
    end
  end
end
