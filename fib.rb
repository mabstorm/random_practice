module Fib
    @fib = Hash.new { |hash, key| hash[key] = hash[key - 1] + hash[key - 2] }
    @fib.merge! 0 => 0, 1 => 1

    def self.[](x)
      @fib[x]
    end
end

require 'minitest'
require 'minitest/autorun'

describe Fib do
    it 'fibs' do
      assert_equal Fib[0], 0
      assert_equal Fib[1], 1
      assert_equal Fib[2], 1
      assert_equal Fib[5], 5
      assert_equal Fib[10], 55
      assert_equal Fib[20], 6765
      assert_equal Fib[19], 4181
    end
end
