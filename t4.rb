#!/Users/mabailey/.rvm/rubies/ruby-2.0.0-p0/bin/ruby


$num_games = 0
$GAME_ROWS = 4
$GAME_COLS = 4
$GAME_RESULTS = ["X won", "O won", "Draw", "Game has not completed"]
$XWIN = "XXXX"
$OWIN = "OOOO"

def parse_game(game)
	xgame = game.map {|row| row.strip.gsub("T", "X")}
	ogame = game.map {|row| row.strip.gsub("T", "O")}

	if (determine_win(xgame, $XWIN))
		return $GAME_RESULTS[0]
	elsif (determine_win(ogame, $OWIN))
		return $GAME_RESULTS[1]
	elsif (is_complete(game))
		return $GAME_RESULTS[2]
	else
		return $GAME_RESULTS[3]
	end
end

def determine_win(game, winstring)

	# horizontal win
	game.each {|a| return true if a==winstring}

	# vertical win
	(0...$GAME_COLS).each do |i|
		string = game.inject("") {|str, row| str + row[i]}
		return true if string==winstring
	end

	# diagonal win
	string1 = ""
	(0...$GAME_ROWS).each {|i| string1+=game[i][i]}
	return true if string1==winstring

	string2 = ""
	(0...$GAME_ROWS).each {|i| string2+=game[i][$GAME_ROWS-i-1]}
	return true if string2==winstring


	return false
end

def is_complete(game)
	game.inject(true) {|result, row| result && !row.include?(".")}
end

def main(filename)
	data = File.open(filename).readlines
	$num_games = data[0].to_i
	(0...$num_games).each do |i|
		# puts "game #{i+1}"
		index1 = i*($GAME_ROWS+1)+1
		index2 = (i+1)*($GAME_ROWS+1)-1
		# puts "(#{index1}, #{$GAME_ROWS})"
		game = data.slice(index1, $GAME_ROWS)
		# puts game
		result = parse_game(game)
		puts "Case ##{i+1}: #{result}\n"
		# puts "----"
	end
end

if __FILE__ == $0
	# (0..1000).each {|i| main(ARGV[0])}
	main(ARGV[0])
else
	main("./input1.txt")
end
