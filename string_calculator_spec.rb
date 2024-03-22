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

  it 'returns nil for each item in array which is not valid' do
    expect(add(['', '1', '1,5', 1, 'a'])).to eq([0, 1, 6, nil, 0])
  end
end
