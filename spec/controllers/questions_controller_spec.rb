require 'rails_helper'


describe QuestionsController do
  let(:user) {create(:user, username: 'Tyaasdfasdf', email: 'ty@example.com')}
  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  context "GET #index" do
    it 'assigns @questions to all questions' do
      get :index
      question = create(:question)
      expect(assigns(:questions)).to eq(Question.all)
    end
  end

  context "GET #new" do
    it 'assigns question to @question' do
      get :new
      expect(assigns(:question)).to be_a_new Question
    end

    it 'redirects user to root path if not logged in' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
      expect(get :new).to redirect_to root_path
    end
  end

  context "GET #show" do
    it 'assigns the question to @question' do
      question = create(:question)
      get :show, { id: question.to_param }
      expect(assigns(:question)).to eq question
    end
  end

  context "POST #create" do

    describe "when valid params are passed" do
      # let(:new_question) { Question.create(title: "hey its a test", content: "hey its a content") }

      it 'creates a new question' do
        expect {
          post :create, { question: {title: "hey its a test", content: "hey its a content"} }
        }.to change{Question.count}.by(1)
      end

      it 'assigns a newly created question as a question' do
        post :create, { question: {title: "hey its a test1", content: "hey its a content1"} }
        expect(assigns(:question)).to be_a Question
      end

      it 'redirects to the newly created question' do
        expect(
          post :create, { question: {title: "hey its a test2", content: "hey its a content2"} }
        ).to redirect_to questions_path(assigns(:question_id))
      end
    end

    describe "when invalid params are passed" do
      it 'does not create a new question' do
        post :create, { question: {title: '', content: "hey its a content4"} }
        expect(assigns(:errors)).to_not be_nil
      end

      it 'sends the user to new question page' do

      end
    end
  end

end
