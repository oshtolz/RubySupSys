require 'csv'

# Create an array to store the data from each of the CSV files
data = []

# Read data from each of the CSV files
CSV.foreach('csv/AZN.csv', headers: true) do |row|
  date = row['Date']
  stock1_volume = row['Volume'].to_i
  data << [date, stock1_volume]
end

CSV.foreach('csv/CSIOY.csv', headers: true) do |row|
  date = row['Date']
  stock2_volume = row['Volume'].to_i
  index = data.index { |d| d[0] == date }
  if index
    data[index] << stock2_volume
  else
    data << [date, nil, stock2_volume]
  end
end

CSV.foreach('csv/CSIQ.csv', headers: true) do |row|
  date = row['Date']
  stock3_volume = row['Volume'].to_i
  index = data.index { |d| d[0] == date }
  if index
    data[index] << stock3_volume
  else
    data << [date, nil, nil, stock3_volume]
  end
end

CSV.foreach('csv/DEO.csv', headers: true) do |row|
  date = row['Date']
  stock4_volume = row['Volume'].to_i
  index = data.index { |d| d[0] == date }
  if index
    data[index] << stock4_volume
  else
    data << [date, nil, nil, nil, stock4_volume]
  end
end

# Comment to exclude ITUB

=begin
CSV.foreach('csv/ITUB.csv', headers: true) do |row|
  date = row['Date']
  stock5_volume = row['Volume'].to_i
  index = data.index { |d| d[0] == date }
  if index
    data[index] << stock5_volume
  else
    data << [date, nil, nil, nil, nil, stock5_volume]
  end
end
=end

# Write the data to the volumes CSV file

# Included ITUB (very high volume)
CSV.open('csv/volumes.csv', 'w', headers: ['Date', 'AZN', 'CSIQY', 'CSIQ', 'DEO', 'ITUB']) do |csv|

# Excluded ITUB
=begin
CSV.open('csv/volumes_small.csv', 'w', headers: ['Date', 'AZN', 'CSIQY', 'CSIQ', 'DEO']) do |csv|
=end
  # Write the headers
  csv << csv.headers

  # Write the data rows
  data.each do |row|
    csv << row
  end
end
