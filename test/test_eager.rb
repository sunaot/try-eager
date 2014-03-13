require 'minitest/unit'
require 'minitest/autorun'
require 'try/eager'
class TestTry < MiniTest::Unit::TestCase
  class TestEager < self
    def test_eager
      Try.eager { assert true }
    end
  
    def test_until
      a = [ false, true ]
      i = 0
      Try.eager until: ->(args) { args } do
        i = i.succ
        a.shift
      end
      assert_equal 2, i
    end
  
    def test_timeout
      assert_raises(Timeout::Error) { Try.eager(timeout: 0.001) { sleep 0.01 } }
    end
  
    def test_returns_block_last_evaluation
      i = Try.eager do
        10
      end
      assert_equal 10, i
    end
  
    def test_returns_block_last_evaluation_loop
      a = [ 30, 20, 10, 5, 1 ]
      i = Try.eager until: ->(args) { args < 20 } do
        a.shift
      end
      assert_equal 10, i
    end
  end

  class TestCall < self
    def test_try
      a = [*0..20]
      digit = Try.(10.times, until: ->(i) { i > 2 }) do
        a.shift
      end
      assert_equal 3, digit
    end
  end
end
