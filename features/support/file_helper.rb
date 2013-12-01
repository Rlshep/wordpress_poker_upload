class FileHelper

  def files_sorted_by_modified_date path, filename_pattern
    Dir["#{path}/#{filename_pattern}"].sort {|x,y| File::mtime(y) <=> File::mtime(x)}
  end

  def latest_file_name path, filename_pattern
    files = files_sorted_by_modified_date path, filename_pattern
    files.first
  end
end