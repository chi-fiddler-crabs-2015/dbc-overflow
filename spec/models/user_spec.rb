require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:questions) }

  it { should have_many(:comments) }

  it { should have_many(:votes) }

  it { should validate_uniqueness_of(:username) }

  it { should validate_uniqueness_of(:email) }

  it { should validate_length_of(:username).is_at_least(6) }

  it { should validate_length_of(:username).is_at_most(20) }

  it { should validate_presence_of(:username) }

  it { should validate_presence_of(:email) }

  it { should validate_presence_of(:password) }

  it { should validate_length_of(:password).is_at_least(6) }

  it { should_not allow_value('^$&#*@*').for(:username)}

  it { should_not allow_value('fakefake.com').for(:email)}
end
