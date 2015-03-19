require 'rails_helper'


describe AnswersController do
  let(:question) { create(:question) }

  # context "POST #create" do

  #   describe "when valid params are passed" do
  #     # let(:new_question) { Question.create(title: "hey its a test", content: "hey its a content") }

  #     it 'creates a new questions' do
  #       expect {
  #         post :create, { question: {title: "hey its a test", content: "hey its a content"} }
  #       }.to change{Question.count}.by(1)
  #     end

  #     it 'assigns a newly created question as a question' do
  #       post :create, { question: {title: "hey its a test", content: "hey its a content"} }
  #       expect(assigns(:question)).to be_a Question
  #     end

  #     it 'redirects to the newly created question' do
  #       expect(
  #         post :create, { question: {title: "hey its a test", content: "hey its a content"} }
  #       ).to redirect_to questions_path(assigns(:question))
  #     end
  #   end

  #   describe "when invalid params are passed" do
  #     it 'does not create a new question' do
  #       expect {
  #         post :create, { question: {content: "hey its a content"} }
  #       }.to change{Question.count}.by(0)
  #     end

  #     it 'sends the user to new question page' do

  #     end
  #   end
  # end

end
