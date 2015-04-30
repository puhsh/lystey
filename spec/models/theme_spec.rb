require 'rails_helper'

RSpec.describe Theme, type: :model do
  it { is_expected.to belong_to(:agent) }

  context 'when creating' do
    describe '.testimonial_page_title' do
      it { is_expected.to validate_length_of(:testimonial_page_title).is_at_most(100) }
    end

    describe '.testimonial_page_main_copy' do
      it { is_expected.to validate_length_of(:testimonial_page_main_copy).is_at_most(10000) }
    end
  end

  context 'when updating' do
    describe '.testimonial_page_title' do
      it { is_expected.to validate_length_of(:testimonial_page_title).is_at_most(100) }
    end

    describe '.testimonial_page_main_copy' do
      it { is_expected.to validate_length_of(:testimonial_page_main_copy).is_at_most(10000) }
    end
  end
end
