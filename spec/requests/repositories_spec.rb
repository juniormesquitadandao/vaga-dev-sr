require 'rails_helper'

RSpec.describe '/repositories', type: :request do
  let(:valid_attributes) do
    attributes_for(:repository)
  end

  let(:invalid_attributes) do
    Repository.new.attributes
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      create(:repository)

      get repositories_url

      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      repository = create(:repository)

      get repository_url(repository)

      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Repository' do
        expect do
          post repositories_url, params: { repository: valid_attributes }
        end.to change(Repository, :count).by(1)
      end

      it 'redirects to the created repository' do
        post repositories_url, params: { repository: valid_attributes }

        expect(response).to redirect_to(repository_url(Repository.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Repository' do
        expect do
          post repositories_url, params: { repository: invalid_attributes }
        end.to change(Repository, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post repositories_url, params: { repository: invalid_attributes }

        expect(response).to be_unprocessable
      end
    end
  end
end
