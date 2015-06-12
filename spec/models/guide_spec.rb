require 'rails_helper'

RSpec.describe Guide, type: :model do
  it { should belong_to(:agent) }
end
