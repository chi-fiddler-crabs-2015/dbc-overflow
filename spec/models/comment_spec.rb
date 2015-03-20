require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:question) { create(:question) }
  let(:user) {create(:user, username: 'Tyaasdfasdf', email: 'ty@example.com')}
  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  it { should belong_to(:user) }

  it { should belong_to(:response) }

  it 'throws an error if content is nil' do
    comment = Comment.create(content: '')
    expect(comment.errors).to_not be_nil
  end
end
