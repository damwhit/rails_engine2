require "test_helper"

class CustomerTest < ActiveSupport::TestCase
  context 'validations' do
    should validate_presence_of(:first_name)
    should validate_presence_of(:last_name)
  end
end
