require 'rails_helper'

RSpec.describe Testimonial, type: :model do
  it { is_expected.to belong_to(:agent) }

  context 'when creating' do
    describe '.text' do
      it { is_expected.to validate_length_of(:text).is_at_most(1000) }
    end
  end

  context 'when updating' do
    describe '.text' do
      it { is_expected.to validate_length_of(:text).is_at_most(1000) }
    end
  end

end
