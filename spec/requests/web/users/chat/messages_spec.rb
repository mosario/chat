require 'rails_helper'

RSpec.describe 'chat messages', type: :request do
  let(:user) { create :user }
  let(:companion) { create :user }

  before(:each) { sign_in user }

  context 'index' do
    let!(:message) { create :message, sender: user, 
                                      receiver: companion }

    it 'render with 200 status' do
      get "/users/#{companion.id}/chat/messages"
      expect(response).to be_success
    end
  end

  context 'create' do
    let(:message_attrs) { attributes_for :message }

    it 'redirect' do
      post "/users/#{companion.id}/chat/messages", message: message_attrs
      expect(response).to be_redirect
    end
  end
end
