# frozen_string_literal: true

require 'rails_helper'

shared_examples 'a CRUD controller' do |model, controller_name, index_path|
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      if controller_name == 'Size'
        type = Type.create(name: 'Example Type')
        instance = model.create(name: "Example #{controller_name}", type_id: type.id)
      else
        instance = model.create(name: "Example #{controller_name}")
      end
      get :show, params: { id: instance.to_param }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      if controller_name == 'Size'
        type = Type.create(name: 'Example Type')
        instance = model.create(name: "Example #{controller_name}", type_id: type.id)
      else
        instance = model.create(name: "Example #{controller_name}")
      end
      get :edit, params: { id: instance.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it "creates a new #{controller_name}" do
        expect do
          if controller_name == 'Size'
            type = Type.create(name: 'Example Type')
            model.create(name: "New #{controller_name}", type_id: type.id)
          else
            post :create, params: { "#{controller_name.downcase}": { name: "New #{controller_name}" } }
          end
        end.to change(model, :count).by(1)
      end

      it "redirects to the created #{controller_name}" do
        if controller_name == 'Size'
          type = Type.create(name: 'Example Type')
          # model.create(name: "New #{controller_name}", type_id: type.id)
          post :create, params: { "#{controller_name.downcase}": { name: "New #{controller_name}", type_id: type.id } }
        else
          post :create, params: { "#{controller_name.downcase}": { name: "New #{controller_name}" } }
          expect(response).to redirect_to(model.last)
        end
      end
    end

    context 'with invalid parameters' do
      it "returns a success response (i.e., to display the 'new' template)" do
        post :create, params: { "#{controller_name.downcase}": { name: nil } }
        expect(response).to_not be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid parameters' do
      it "updates the requested #{controller_name}" do
        if controller_name == 'Size'
          type = Type.create(name: 'Example Type')
          instance = model.create(name: "Example #{controller_name}", type_id: type.id)
        else
          instance = model.create(name: "Example #{controller_name}")
        end
        put :update,
            params: { id: instance.to_param, "#{controller_name.downcase}": { name: "Updated #{controller_name}" } }
        instance.reload
        expect(instance.name).to eq("Updated #{controller_name}")
      end

      it "redirects to the #{controller_name}" do
        if controller_name == 'Size'
          type = Type.create(name: 'Example Type')
          instance = model.create(name: "Example #{controller_name}", type_id: type.id)
        else
          instance = model.create(name: "Example #{controller_name}")
        end
        put :update,
            params: { id: instance.to_param, "#{controller_name.downcase}": { name: "Updated #{controller_name}" } }
        expect(response).to redirect_to(instance)
      end
    end

    context 'with invalid parameters' do
      it "returns a success response (i.e., to display the 'edit' template)" do
        if controller_name == 'Size'
          type = Type.create(name: 'Example Type')
          instance = model.create(name: "Example #{controller_name}", type_id: type.id)
        else
          instance = model.create(name: "Example #{controller_name}")
        end
        put :update, params: { id: instance.to_param, "#{controller_name.downcase}": { name: nil } }
        expect(response).to_not be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it "destroys the requested #{controller_name}" do
      if controller_name == 'Size'
        type = Type.create(name: 'Example Type')
        instance = model.create(name: "Example #{controller_name}", type_id: type.id)
      else
        instance = model.create(name: "Example #{controller_name}")
      end
      expect do
        delete :destroy, params: { id: instance.to_param }
      end.to change(model, :count).by(-1)
    end

    it "redirects to the #{index_path}" do
      if controller_name == 'Size'
        type = Type.create(name: 'Example Type')
        instance = model.create(name: "Example #{controller_name}", type_id: type.id)
      else
        instance = model.create(name: "Example #{controller_name}")
      end
      delete :destroy, params: { id: instance.to_param }
      expect(response).to redirect_to(send("#{index_path}_url"))
    end
  end

  describe 'POST #create' do
    context 'with invalid parameters' do
      it 'renders the new template with unprocessable_entity status (HTML)' do
        post :create, params: { "#{controller_name.downcase}": { name: nil } }

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'renders a JSON response with unprocessable_entity status (JSON)' do
        post :create, params: { "#{controller_name.downcase}": { name: nil } }, format: :json

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH #update' do
    let(:instance) do
      if controller_name == 'Size'
        type = Type.create(name: 'Example Type')
        model.create(name: "Example #{controller_name}", type_id: type.id)
      else
        model.create(name: "Example #{controller_name}")
      end
    end

    context 'with invalid parameters' do
      it 'renders the edit template with unprocessable_entity status (HTML)' do
        patch :update, params: { id: instance.id, "#{controller_name.downcase}": { name: nil } }

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'renders a JSON response with unprocessable_entity status (JSON)' do
        patch :update, params: { id: instance.id, "#{controller_name.downcase}": { name: nil } }, format: :json

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end

RSpec.describe ColorsController, type: :controller do
  it_behaves_like 'a CRUD controller', Color, 'Color', 'colors'
end

RSpec.describe ConditionsController, type: :controller do
  it_behaves_like 'a CRUD controller', Condition, 'Condition', 'conditions'
end

RSpec.describe GendersController, type: :controller do
  it_behaves_like 'a CRUD controller', Gender, 'Gender', 'genders'
end

RSpec.describe SizesController, type: :controller do
  it_behaves_like 'a CRUD controller', Size, 'Size', 'sizes'
end

RSpec.describe StatusesController, type: :controller do
  it_behaves_like 'a CRUD controller', Status, 'Status', 'statuses'
end

RSpec.describe TypesController, type: :controller do
  it_behaves_like 'a CRUD controller', Type, 'Type', 'types'
end
