require 'rails_helper'

RSpec.describe Theme, type: :model do
  it { is_expected.to belong_to(:agent) }
end
