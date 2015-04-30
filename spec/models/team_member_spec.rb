require 'rails_helper'

RSpec.describe TeamMember, type: :model do
  it { is_expected.to belong_to(:team) }
end
