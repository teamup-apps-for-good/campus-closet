require 'rails_helper'

RSpec.describe StatusesController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      status = Status.create(name: "Example Status")
      get :show, params: { id: status.to_param }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      status = Status.create(name: "Example Status")
      get :edit, params: { id: status.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new Status" do
        expect {
          post :create, params: { status: { name: "New Status" } }
        }.to change(Status, :count).by(1)
      end

      it "redirects to the created status" do
        post :create, params: { status: { name: "New Status" } }
        expect(response).to redirect_to(Status.last)
      end
    end

    context "with invalid parameters" do
      it "returns a success response (i.e., to display the 'new' template)" do
        post :create, params: { status: { name: nil } }
        expect(response).to_not be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid parameters" do
      it "updates the requested status" do
        status = Status.create(name: "Example Status")
        put :update, params: { id: status.to_param, status: { name: "Updated Status" } }
        status.reload
        expect(status.name).to eq("Updated Status")
      end

      it "redirects to the status" do
        status = Status.create(name: "Example Status")
        put :update, params: { id: status.to_param, status: { name: "Updated Status" } }
        expect(response).to redirect_to(status)
      end
    end

    context "with invalid parameters" do
      it "returns a success response (i.e., to display the 'edit' template)" do
        status = Status.create(name: "Example Status")
        put :update, params: { id: status.to_param, status: { name: nil } }
        expect(response).to_not be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested status" do
      status = Status.create(name: "Example Status")
      expect {
        delete :destroy, params: { id: status.to_param }
      }.to change(Status, :count).by(-1)
    end

    it "redirects to the statuses list" do
      status = Status.create(name: "Example Status")
      delete :destroy, params: { id: status.to_param }
      expect(response).to redirect_to(statuses_url)
    end
  end
end
