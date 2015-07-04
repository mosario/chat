require 'rails_helper'

RSpec.describe 'chat messages', type: :request do
  let(:user) { create :user }
  let(:companion) { create :user }

  before(:each) { sign_in user }

  context 'index' do
    it 'render with 200 status' do
      get "/users/#{companion.id}/chat/messages"
      expect(response).to be_success
    end
  end
end
