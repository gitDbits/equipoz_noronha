require 'rails_helper'

RSpec.describe Equipment, type: :model do
  it { should validate_presence_of(:serial_number) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:category) }
  it { should validate_presence_of(:replacement_value) }
  it { should validate_presence_of(:acquisition_date) }
  it { should validate_presence_of(:usage_limit) }
end
