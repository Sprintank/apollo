require 'test_helper'

class BandTest < ActiveSupport::TestCase
  test "basic band creation with identifier generator" do
    band = FactoryGirl.create(:band, :name => 'Explosions in the Sky')
    assert_equal 'explosions-in-the-sky', band.identifier
  end

  test "update_page_style by field_name and field_key should add a new row it not exists, and update existing rows" do
    band = FactoryGirl.create(:band)
    band.update_page_style('my_field', 'my_value')
    assert_equal 1, band.page_styles.size

    band.update_page_style('my_field', 'my_value2')
    assert_equal 1, band.page_styles.size

    assert_equal 'my_value2', band.page_styles.find_by(:field_name => 'my_field').field_value
  end
end
