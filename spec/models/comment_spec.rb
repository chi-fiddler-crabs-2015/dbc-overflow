require 'rails_helper'

RSpec.describe Comment, type: :model do

  it { should belong_to(:user) }

  it { should belong_to(:response) }

  it 'throws an error if content is nil' do
    comment = Comment.create(content: '')
    expect(comment.errors).to_not be_nil
  end
end
