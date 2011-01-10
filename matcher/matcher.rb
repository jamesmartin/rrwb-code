class Matcher
  def match(expected, actual, clip_limit, delta) 
    actual = clip_large_values_from(actual, clip_limit)

    return false if lengths_differ?(actual, expected)

    all_entries_within_expected_delta?(expected, actual, delta)
  end

  def clip_large_values_from(array, limit)
    array.map { |val| [val, limit].min }
  end

  def lengths_differ?(actual, expected)
    actual.length != expected.length
  end

  def all_entries_within_expected_delta?(expected, actual, delta)
    actual.each_index { |i|
      return false if (expected[i] - actual[i]).abs > delta
    }
    return true
  end

end
