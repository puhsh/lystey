require 'rails_helper'

RSpec.describe Guide, type: :model do
  it { should belong_to(:agent) }

  describe '.buyers_guide_page_title' do
    it { is_expected.to validate_length_of(:guide_title).is_at_most(100) }
  end

  describe '.buyers_guide_page_main_copy' do
    it { is_expected.to validate_length_of(:content).is_at_most(10000) }
  end
end
