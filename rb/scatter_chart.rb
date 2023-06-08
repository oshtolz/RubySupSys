require 'gruff'
require 'csv'

data = CSV.read('csv/AZN.csv', headers: true)

scatter_chart = Gruff::Scatter.new(800)
scatter_chart.title = 'AZN Close Prices'

x_data = data['Date'].map { |date| Date.parse(date).strftime('%m/%d/%Y') }
y_data = data['Close'].map(&:to_f)
scatter_chart.data('Close', x_data, y_data)

scatter_chart.x_axis_label = 'Date'
scatter_chart.y_axis_label = 'Close Price'

scatter_chart.write('scatter_chart.png')
