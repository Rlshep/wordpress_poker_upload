require 'date'

class ResultsTableHelper
  def get_file_name(full_file_name)
    full_file_name[full_file_name.rindex('/') + 1, full_file_name.size]
  end

  def get_full_truncated_file_name(full_file_name)
    ((get_path_name full_file_name) + 'truncated_' + (get_file_name full_file_name)).gsub '/', '\\'
  end

  def get_full_windows_file_name(full_file_name)
    full_file_name.gsub '/', '\\'
  end

  def get_path_name(full_file_name)
    full_file_name[0, full_file_name.rindex('/') + 1]
  end

  def get_table_name(full_file_name)
    (get_file_name full_file_name).sub '.csv', ''
  end

  def get_summary_name_from_result_name(full_file_name)
    get_table_name(full_file_name).sub 'Results', 'Summary'
  end

  def get_month_year_from_name(full_file_name)
    (get_table_name(full_file_name).sub 'Summary', '').strip
  end

end