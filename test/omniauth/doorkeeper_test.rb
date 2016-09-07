require 'test_helper'

class Omniauth::DoorkeeperTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Omniauth::Doorkeeper::VERSION
  end

  def test_it_does_something_useful
    assert true
  end
end
