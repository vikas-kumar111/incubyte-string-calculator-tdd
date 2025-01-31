require_relative 'string_calculator'

RSpec.describe '#add' do
  it 'returns no output for an empty string' do
    expect(add([])).to eq([])
  end

  it 'returns the number for a single number' do
    expect(add(['1'])).to eq([1])
  end

  it 'returns the sum of numbers for comma-separated strings' do
    expect(add(['', '1', '1,5'])).to eq([0, 1, 6])
  end

  it 'returns nil if input is not array' do
    expect(add('')).to eq(nil)
  end

  it 'returns array nil if input is not an array of strings' do
    expect(add([1, 2, 3])).to eq([nil, nil, nil])
  end

  it 'returns nil for each item in array which is not string' do
    expect(add(['', '1', '1,5', 1, 'a'])).to eq([0, 1, 6, nil, 0])
  end
end

RSpec.describe '#add_string' do
  it 'returns the sum of numbers for comma-separated strings' do
    expect(add_string('1,5')).to eq(6)
  end

  it 'returns the sum of numbers for strings with new lines between numbers' do
    expect(add_string("1\n2,3")).to eq(6)
  end

  it 'returns 0 for invalid input with new line following a comma' do
    expect(add_string("1,\n")).to eq(0)
  end

  it 'returns nil for invalid input' do
    expect(add_string(1)).to eq(nil)
  end

  it 'returns the sume of numbers for strings with custom delimeter' do
    expect(add_string("//;\n1;2;3")).to eq(6)
  end

  it 'raises an exception for negative numbers' do
    expect { add_string('1,-2,3') }.to raise_error('negative numbers not allowed -2')
    expect { add_string('1,-2,-3') }.to raise_error('negative numbers not allowed -2, -3')
  end
end

RSpec.describe '#get_delimeter' do
  it 'returns comma for strings without delimeter' do
    expect(get_delimeter('1,2,3')).to eq(',')
  end

  it 'returns the delimeter for strings with delimeter' do
    expect(get_delimeter("//;\n1;2;3")).to eq(';')
  end
end
