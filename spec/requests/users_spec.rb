require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/users", type: :request do
  let!(:user1) { FactoryBot.create(:user, nome: 'luiz davi', password: "123", email: "luizd4398@gmail.com", cpf: "12345678978") }
  let!(:user2) { FactoryBot.create(:user, nome: 'user', password: "456", email: "user@gmail.com", cpf: "78945612312") }
  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      get "/users"

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(2)
      expect(JSON.parse(response.body)).to eq([
        {
          "cpf"=>"12345678978",
          "created_at"=>"2022-01-25T01:31:47.588Z",
          "email"=>"luizd4398@gmail.com",
          "id"=>1,
          "nome"=>"luiz davi",
          "password_digest"=>
           "$2a$04$MIDT0rg25r1NOjWnuCEr/eEtAzvsbyYPlIQwVeW..dLUTRaGJSczy",
          "updated_at"=>"2022-01-25T01:31:47.588Z"
        },
         {
          "cpf"=>"78945612312",
          "created_at"=>"2022-01-25T01:31:47.594Z",
          "email"=>"user@gmail.com",
          "id"=>2,
          "nome"=>"user",
          "password_digest"=>
           "$2a$04$zINsdm.ef6Ltu6ELg6rI6OOGRr18TxUOq.53SLOfL4lzfEn1hb.Z.",
          "updated_at"=>"2022-01-25T01:31:47.594Z"
        }
          ])
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      user = User.create! valid_attributes
      get user_url(user), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new User" do
        expect {
          post users_url,
               params: { user: valid_attributes }, headers: valid_headers, as: :json
        }.to change(User, :count).by(1)
      end

      it "renders a JSON response with the new user" do
        post users_url,
             params: { user: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new User" do
        expect {
          post users_url,
               params: { user: invalid_attributes }, as: :json
        }.to change(User, :count).by(0)
      end

      it "renders a JSON response with errors for the new user" do
        post users_url,
             params: { user: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested user" do
        user = User.create! valid_attributes
        patch user_url(user),
              params: { user: new_attributes }, headers: valid_headers, as: :json
        user.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the user" do
        user = User.create! valid_attributes
        patch user_url(user),
              params: { user: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the user" do
        user = User.create! valid_attributes
        patch user_url(user),
              params: { user: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested user" do
      user = User.create! valid_attributes
      expect {
        delete user_url(user), headers: valid_headers, as: :json
      }.to change(User, :count).by(-1)
    end
  end
end
