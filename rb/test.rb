require 'csv'
require 'gruff'

csv_file = 'csv/AZN.csv'

# Read the Close data from the CSV file into an array
close_data = []
adj_close_data = []

CSV.foreach(csv_file, headers: true) do |row|
  close_data << row['Close'].to_f
  adj_close_data << row['Adj Close'].to_f
end

# Populate x_data_points with the index of each data point
x_data_points = (0...close_data.length).to_a

# Populate y_data_points with the Close data
y_data_points = close_data

# Create a Gruff::Scatter object
g = Gruff::Scatter.new

# Set the title and labels
g.title = 'AZN Close Scatter and Adj Close Bezier'
g.x_axis_label = 'Index'
g.y_axis_label = 'Close'

# Add the scatter data
g.data(:Close, x_data_points, y_data_points)

# Add the bezier line data
g.data(:AdjClose, x_data_points, adj_close_data)

# Write the graph to a file
g.write('scatter_bezier.png')
