require 'csv'
require 'gruff'

# Read in the CSV data
# Including ITUB

data = CSV.read('csv/volumes.csv', headers: true)


# Excluding ITUB
=begin
data = CSV.read('csv/volumes_small.csv', headers: true)
=end

# Initialize arrays to hold the dates and volume values
dates = []
volumes = {}

# Loop through each row of the data and extract the relevant columns
data.each do |row|
  date = row['Date'][0..6] # Only keep year and month, remove day
  dates << date

  # Loop through each column of the row and extract the volume value
  row.each do |column, value|
    next if column == 'Date' # Skip the Date column
    volumes[column] ||= []
    volumes[column] << value.to_f
  end
end

# Create line chart of Volume for each stock
line_chart = Gruff::Line.new
line_chart.marker_font_size = 12
line_chart.title = 'Volume comparison'
line_chart.labels = dates

volumes.each do |stock, values|
  line_chart.data(stock, values)
end

# Including ITUB
line_chart.write('output/other/Volume_line.png')

# Excluding ITUB
=begin
line_chart.write('output/other/Volume_line_small.png')
=end