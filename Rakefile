task :standart_visualisation do
    csv_file = ENV['CSV_FILE']
    run_task("open_chart", csv_file)
    run_task("close_chart", csv_file)
    run_task("high_chart", csv_file)
    run_task("low_chart", csv_file)
    run_task("line_chart", csv_file)
    run_task("with_table", csv_file)
end
   
task :extended_visualisation do
    run_task0("to_volume")
    run_task0("to_adj-close")
    run_task0("volume_chart")
    run_task0("adj_close_chart")    
end

def run_task(task_name, csv_file)
    sh "ruby rb/#{task_name}.rb #{csv_file}"
end
def run_task0(task_name)
    sh "ruby rb/#{task_name}.rb"
end

=begin
To run all project use
rake standart_visualisation CSV_FILE=AZN.csv && rake standart_visualisation CSV_FILE=CSIOY.csv && 
rake standart_visualisation CSV_FILE=CSIQ.csv && rake standart_visualisation CSV_FILE=GOOD.csv && 
rake standart_visualisation CSV_FILE=ITUB.csv && rake standart_visualisation CSV_FILE=TJX.csv && 
rake extended_visualisation 
=end