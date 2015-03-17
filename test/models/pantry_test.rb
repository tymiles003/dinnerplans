require 'test_helper'

class PantryTest < ActiveSupport::TestCase
  def setup
  	@user = users(:one)
  	@pantry = @user.build_pantry
  end

  test "should be valid" do
  	assert @pantry.valid?
  end

  test "user id should be present" do
  	@pantry.user_id = nil
  	assert_not @pantry.valid?
  end

end