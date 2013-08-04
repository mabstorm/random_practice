#!/Users/mabailey/.rvm/rubies/ruby-2.0.0-p0/bin/ruby


def palindrome?(num)
	st = num.to_s
	return (st == st.reverse)
end

def valid?(num)
	return false if (!palindrome?(num))
	root = get_root(num)
	return false if (root==nil)
	return palindrome?(root)
end

def get_root(num)
	root = Math.sqrt(num)
	root_i = root.to_i
	return (root == root_i) ? root_i : nil
end

def test_range(start_range, end_range)
	root = get_root(start_range)
	num_results = 0
	while (root==nil)
		start_range+=1
		root = get_root(start_range)
	end
	square = root*root
	while (square <= end_range)
		if (valid?(square))
			num_results+=1
		end
		root+=1
		square = root*root
	end
	return num_results
end

def main(filename)
	data = File.open(filename).readlines
	$num_puzzles = data[0].to_i
	(1..$num_puzzles).each do |i|
		(start_range, end_range) = data[i].split.map {|a| a.to_i}
		result = test_range(start_range, end_range)
		puts "Case ##{i}: #{result}"
	end
end

if __FILE__ == $0
	main(ARGV[0])
else
	main("./input3.txt")
end
