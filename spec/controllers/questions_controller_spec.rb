require 'rails_helper'


describe QuestionsController do

  context "GET #index" do
    it 'assigns @questions to all questions' do
      question = create(:question)
      expect(assigns(:questions)).to eq(Question.all)
    end
  end

  context "GET #new" do
    it 'assigns question to @question' do
    end
  end

  context "GET #show" do
    it 'assigns the question to @question' do
    end
  end

  context "POST #create" do

    describe "when valid params are passed" do
      it 'creates a new questions' do
      end

      it 'assigns a newly created question as a question' do
      end

      it 'redirects to the newly created question' do
      end
    end

    describe "when invalid params are passed" do
      it 'does not create a new question' do
      end

      it 'sends the user to new question page' do
      end
    end
  end

end
