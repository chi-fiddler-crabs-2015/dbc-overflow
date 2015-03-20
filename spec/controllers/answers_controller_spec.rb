require 'rails_helper'


describe AnswersController do
  let(:question) { create(:question) }
  let(:user) {create(:user, username: 'Tyaasdfasdf', email: 'ty@example.com')}
  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end


  context "POST #create" do

    describe "when valid params are passed" do
      it 'creates a new answer' do
        expect {
        post :create, question_id: question.id, answer: {content: "hey its a content", user: user}}
        .to change{Answer.count}.by(1)
      end

      it 'assigns a newly created answer as an answer' do
        post :create, question_id: question.id, answer: {content: "hey its a content", user: user}
        expect(assigns(:answer)).to be_a Answer
      end

      it 'redirects to the newly created answers question page' do
        expect(
          post :create, question_id: question.id, answer: {content: "hey its a content", user: user}
        ).to redirect_to question_path(question.id)
      end
    end

    describe "when invalid params are passed" do
      it 'does not create a new answer' do
        expect {
          post :create, question_id: question.id, answer: {content: ""}}
        .to change{Answer.count}.by(0)
      end

      it 'redirects the user to question page' do
        expect(
          post :create, question_id: question.id, answer: {content: ""}
        ).to redirect_to question_path(question.id)
      end
    end
  end

end
