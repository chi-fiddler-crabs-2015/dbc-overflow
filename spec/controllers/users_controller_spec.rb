require 'rails_helper'

describe UsersController do

  describe "POST create" do

    context 'when valid parameters are passed' do
      it 'creates a new user' do
        expect {
          post :create, { user: {username: "fakefake", email: "fake@fake.com", password: "12345678"} }
        }.to change{User.count}.by(1)
      end
      it 'assigns a newly created user as a user' do
        post :create, { user: {username: "fakefake", email: "fake@fake.com", password: "12345678"} }
        expect(assigns(:user)).to be_a User
      end

      it 'redirects to the root' do
        expect(
          post :create, { user: {username: "fakefake", email: "fake@fake.com", password: "12345678"} }
        ).to redirect_to root_path
      end
    end

    context 'when invalid parameters are passed' do
      it 'assigns a newly created user but unsaved' do
        post :create, { user: { username: '1' } }
        expect(assigns(:user)).to be_a_new User
      end

      it 'does not allow a user to create with a missing username' do
        post :create, { user: {email: "fake@fake.com", password: "12345678"} }
        expect(assigns(:errors)).to_not be_nil
      end

      it "re-renders the 'new' template" do
        expect(
          post :create, { user: { username: '1' } }
        ).to render_template(:new)
      end
    end
  end

end
