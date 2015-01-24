require 'test_helper'

class BandTest < ActiveSupport::TestCase
  def setup
    @theme01 = Theme.find_or_create_by(:identifier => 'theme01')
  end

  test "basic band creation with identifier generator" do
    band = FactoryGirl.create(:band, :theme => @theme01, :name => 'Explosions in the Sky')
    assert_equal 'explosions-in-the-sky', band.identifier
  end

  test "update_field_value by field_name and field_key should add a new row it not exists, and update existing rows" do
    band = FactoryGirl.create(:band, :theme => @theme01)
    field_option = FactoryGirl.create(:field_option)

    band.update_field_value('my_value', field_option)
    assert_equal 1, band.field_values.size

    band.update_field_value('my_value2', field_option)
    assert_equal 1, band.field_values.size

    assert_equal 'my_value2', band.field_values.find_by(:field_option => field_option).value
  end
end