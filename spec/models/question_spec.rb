require 'rails_helper'

RSpec.describe Question, type: :model do
  it { should have_many(:answers) }

  it { should have_many(:comments) }

  it { should have_many(:votes) }

  it { should belong_to(:user) }
end
