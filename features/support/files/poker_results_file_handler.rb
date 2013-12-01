require 'csv'

class PokerResultsFileHandler
  def parse_poker_results_csv_file_by_path_and_file_name path, file_name
    csv_text = File.read(path + file_name)
    csv = CSV.parse(csv_text)
    csv = csv.sort_by{|k| k[0].to_i}

    # Rank,Nickname,Points,Buyin Cost,Prize Winnings,First Name,Last Name,Email 1,Email 2,Street Address,City,State,
    # Zipcode,Country,Phone 1,Phone 2,Notes,Paid,Bounty Chip,Total Buyin Rake,Buyin Chips,Rebuys,Rebuys Cost,
    # Total Rebuys Rake,Rebuys Chips,Add-ons,Add-ons Cost,Total Add-ons Rake,Add-ons Chips,Total Cost,Total Rake,
    # Chips Bought,Time Out,Round Out,Hitman,Hits,Bounties Won,Bounty Winnings,Total Winnings,Take,Chip Count
    CSV.open(path + 'truncated_' + file_name, 'wb') do |trunc_csv|
      csv.each do |row|
        #Rank, Nickname, Points, Time Out, Round Out, Hitman, Hits, Total Winnings
        trunc_csv << [row[0], row[1], row[2], row[32], row[33], row[34], row[35], row[38]]
      end
    end
  end
end