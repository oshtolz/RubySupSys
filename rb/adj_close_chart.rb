require 'csv'
require 'gruff'

# Read in the CSV data
# Including ITUB
=begin
data = CSV.read('csv/adj_close.csv', headers: true)
=end

# Excluding ITUB

data = CSV.read('csv/adj_close.csv', headers: true)


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
# line_chart.title = 'Adj close comparison 2021 - 2023'
line_chart.title = 'Adj Close comparison without ITUB 2021 - 2023'
line_chart.labels = dates
line_chart.label_rotation = -45
volumes.each do |stock, values|
  line_chart.data(stock, values)
end

# Including ITUB
=begin
line_chart.write('output/other/Adj_close_line_2021-2023.png')
=end
# Excluding ITUB

line_chart.write('output/other/Adj_close_line_small_2021-2023.png')