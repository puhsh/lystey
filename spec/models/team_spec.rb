require 'rails_helper'

RSpec.describe Team, type: :model do
  it { is_expected.to belong_to(:agent) }
  it { is_expected.to have_many(:team_members).dependent(:destroy) }
  it { is_expected.to have_many(:team_openings).dependent(:destroy) }
end
