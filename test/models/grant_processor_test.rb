require 'test_helper'

class GrantProcessorTest < ActiveSupport::TestCase
  test "#filter returns all grants by default" do
    Hash hash = {}
    results = GrantProcessor.filter(hash)
    assert !results.blank?, "#filter is broken"
  end
end
