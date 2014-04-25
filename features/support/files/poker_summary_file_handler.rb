require 'csv'

class PokerSummaryFileHandler

  def create_new_poker_summary_file(path, latest_summary, latest_results, title)
    new_summary_name = ResultsTableHelper.new.get_summary_name_from_result_name latest_results
    new_summary_name = path + '/' + new_summary_name + '.csv'
    new_summary_array = get_new_poker_summary_from_previous latest_summary


    if new_summary_array.nil? || new_summary_array.empty?
      add_new_results_for_first_summary new_summary_array, latest_results
    else
      add_new_results_to_new_poker_summary new_summary_array, latest_results
    end

    new_summary_array[0] << title
    add_new_empty_columns new_summary_array
    add_summary_totals new_summary_array
    sort_summary_array new_summary_array

    write_csv_file_from_array new_summary_name, new_summary_array

    new_summary_name
  end

  def add_new_results_for_first_summary(summary_array, latest_results)
    results_csv = CSV.parse(File.read(latest_results))
    first_row = true

    results_csv.each do |result_row|
      if first_row
        summary_array << ['Name']
        first_row = false
      else
        summary_array << [result_row[1], result_row[2]]
      end
    end

  end

  def get_new_poker_summary_from_previous(latest_summary)
    summary_csv = Array.new
    if !latest_summary.nil?
      summary_csv = CSV.parse(File.read(latest_summary))
    end

    new_summary_full = Array.new
    original_summary_size = 0
    first_row = true

    summary_csv.each do |row|
      if first_row
        original_summary_size = row.length
        first_row = false
      end

      #Nickname, ...Previous Points..., Total
      #Leave out Total
      new_summary_row = Array.new
      for i in 0..original_summary_size - 2
        new_summary_row.push row[i]
      end

      new_summary_full.push new_summary_row
    end

    new_summary_full
  end

  def add_new_results_to_new_poker_summary(summary_array, latest_results)
    results_csv = CSV.parse(File.read(latest_results))
    original_summary_row_size = summary_array[0].length
    first_row = true

    results_csv.each do |result_row|
      if first_row
        first_row = false
      else
        add_new_results(original_summary_row_size, result_row, summary_array)
      end
    end

    summary_array
  end

  def add_new_results(original_summary_row_size, result_row, summary_array)
    found = false

    summary_array.each do |summary_row|
      if summary_row[0] == result_row[1] # Nickname
        summary_row.push result_row[2] # Points
        found = true
      end
    end

    if !found
      add_new_summary_row(summary_array, original_summary_row_size, result_row)
    end
  end

  def add_new_summary_row(summary_array, original_summary_row_size, result_row)
    new_summary_row = [result_row[1]] # Nickname

    for i in 0..original_summary_row_size-2 # One for name, one for Total
      new_summary_row.push ''
    end

    new_summary_row.push result_row[2]    # Points
    summary_array.push new_summary_row
  end

  def add_new_empty_columns(summary_array)
    total_columns = summary_array[0].length

    summary_array.each do |summary_row|
      while summary_row.length < total_columns
        summary_row.push ''
      end
    end
  end

  def add_summary_totals(summary_array)
    first_row = true

    summary_array.each do |summary_row|
      if first_row
        summary_row.push 'Total'
        first_row = false
      else
        summary_row.push add_total_for_row summary_row
      end
    end
  end

  def add_total_for_row(summary_row)
    first_column = true
    total_points = 0
    summary_row.each do |points|
      if first_column
        first_column = false
      else
        total_points += points.to_i
      end
    end

    total_points
  end

  def sort_summary_array(new_summary_array)
    header = new_summary_array[0]
    new_summary_array.delete_at 0
    new_summary_array.sort_by!{|k| -k[new_summary_array[0].length-1].to_i}
    new_summary_array.unshift header
  end

  def write_csv_file_from_array (csv_name, two_dim_data_array)
    CSV.open(csv_name, 'wb', :force_quotes => false) do |new_row|
      two_dim_data_array.each do |data_row|
        new_row << data_row
      end
    end
  end
end