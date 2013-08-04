#!/Users/mabailey/.rvm/rubies/ruby-2.0.0-p0/bin/ruby
require 'matrix'

$num_games = 0
$ROWS = 0
$COLS = 0
$RESULTS = ["NO", "YES"]


def valid?(lawn)
	lawn.each_with_index do |val, row_i, col_i|
		# puts "val: #{val}"

		valid1 = false
		valid2 = false
		if (val == lawn.column(col_i).max)		
			# puts "valid 1"
			valid1 = true
		end
		if (val == lawn.row(row_i).max)
			# puts "valid 2"
			valid2 = true
		end

		return false if (!(valid1 || valid2))
	end
	return true
end

def main(filename)
	data = File.open(filename).readlines
	$num_puzzles = data[0].to_i
	next_start_index = 1
	(0...$num_puzzles).each do |i|
		($ROWS, $COLS) = data[next_start_index].split.map {|a| a.to_i}
		lawn = Matrix.rows(data.slice(next_start_index + 1, $ROWS).map {|a| a.chomp.split})
		next_start_index = next_start_index + $ROWS + 1
		result = valid? lawn
		result = (result) ? 0 : 1
		result = $RESULTS[result]
		puts "Case ##{i+1}: #{result}"
		# puts lawn
		# puts "----"
	end
end

if __FILE__ == $0
	main(ARGV[0])
else
	main("./input2.txt")
end
