require 'rails_helper'

RSpec.describe 'registrations', type: :request do
  context 'new' do
    it 'render with 200 status' do
      get "/registrations/new"
      expect(response).to be_success
    end
  end

  context 'create' do
    let(:user_attrs) { attributes_for :user }

    it 'sign in user' do
      post "/registrations", user: user_attrs
      expect(response).to be_redirect
    end
  end
end
