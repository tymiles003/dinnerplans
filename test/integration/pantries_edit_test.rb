require 'test_helper'

class PantriesEditTest < ActionDispatch::IntegrationTest
  def setup
    @pantry = pantries(:one)
  end

  test "must be logged in to edit" do
    get edit_pantry_path(@pantry)
    assert_redirected_to @pantry
  end
end
