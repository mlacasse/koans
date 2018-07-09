require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutArrays < Neo::Koan
  def test_creating_arrays
    empty_array = Array.new
    assert_equal Array, empty_array.class
    assert_equal 0, empty_array.size
  end

  def test_array_literals
    array = Array.new
    assert_equal [], array

    array[0] = 1
    assert_equal [1], array

    array[1] = 2
    assert_equal [1,2], array

    array << 333
    assert_equal [1,2,333], array
  end

  def test_accessing_array_elements
    array = [:peanut, :butter, :and, :jelly]

    assert_equal :peanut, array[0]
    assert_equal :peanut, array.first
    assert_equal :jelly, array[3]
    assert_equal :jelly, array.last
    assert_equal :jelly, array[-1]
    assert_equal :butter, array[-3]
  end

  def test_slicing_arrays
    array = [:peanut, :butter, :and, :jelly]
    #        0        1        2     3     4 <- Ruby adds a 4th element to denote the end of the array.
    assert_equal [:peanut], array[0,1]
    assert_equal [:peanut,:butter], array[0,2]
    assert_equal [:and,:jelly], array[2,2]
    assert_equal [:and,:jelly], array[2,20]
    assert_equal [], array[4,0]
    assert_equal [], array[4,100]
    assert_equal nil, array[5,0] # If you try to slice outside the array (past the end of array element) you get nil back.
  end

  def test_arrays_and_ranges
    assert_equal Range, (1..5).class
    assert_not_equal [1,2,3,4,5], (1..5)
    assert_equal [1,2,3,4,5], (1..5).to_a # (x..y) starts at x and includes y
    assert_equal [1,2,3,4], (1...5).to_a # (x...y) starts at x and stops before y
  end

  def test_slicing_with_ranges
    array = [:peanut, :butter, :and, :jelly]

    assert_equal [:peanut,:butter,:and], array[0..2]
    assert_equal [:peanut,:butter], array[0...2]
    assert_equal [:and,:jelly], array[2..-1] # remember, negative index within an array means wrap around from 0, e.g. -1 means last array element that has a value.
  end

  def test_pushing_and_popping_arrays
    array = [1,2]
    array.push(:last)

    assert_equal [1,2,:last], array

    popped_value = array.pop
    assert_equal :last, popped_value
    assert_equal [1,2], array
  end

  def test_shifting_arrays
    array = [1,2]
    array.unshift(:first) # insert element to head of array

    assert_equal [:first,1,2], array

    shifted_value = array.shift # drop head element off array
    assert_equal :first, shifted_value
    assert_equal [1,2], array
  end

end
