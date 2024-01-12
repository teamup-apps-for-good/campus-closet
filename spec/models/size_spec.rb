require 'rails_helper'

RSpec.describe SizesController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      size = Size.create(name: "Example Size")
      get :show, params: { id: size.to_param }
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
      size = Size.create(name: "Example Size")
      get :edit, params: { id: size.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new Size" do
        expect {
          post :create, params: { size: { name: "New Size" } }
        }.to change(Size, :count).by(1)
      end

      it "redirects to the created size" do
        post :create, params: { size: { name: "New Size" } }
        expect(response).to redirect_to(Size.last)
      end
    end

    context "with invalid parameters" do
      it "returns a success response (i.e., to display the 'new' template)" do
        post :create, params: { size: { name: nil } }
        expect(response).to_not be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid parameters" do
      it "updates the requested size" do
        size = Size.create(name: "Example Size")
        put :update, params: { id: size.to_param, size: { name: "Updated Size" } }
        size.reload
        expect(size.name).to eq("Updated Size")
      end

      it "redirects to the size" do
        size = Size.create(name: "Example Size")
        put :update, params: { id: size.to_param, size: { name: "Updated Size" } }
        expect(response).to redirect_to(size)
      end
    end

    context "with invalid parameters" do
      it "returns a success response (i.e., to display the 'edit' template)" do
        size = Size.create(name: "Example Size")
        put :update, params: { id: size.to_param, size: { name: nil } }
        expect(response).to_not be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested size" do
      size = Size.create(name: "Example Size")
      expect {
        delete :destroy, params: { id: size.to_param }
      }.to change(Size, :count).by(-1)
    end

    it "redirects to the sizes list" do
      size = Size.create(name: "Example Size")
      delete :destroy, params: { id: size.to_param }
      expect(response).to redirect_to(sizes_url)
    end
  end
end
