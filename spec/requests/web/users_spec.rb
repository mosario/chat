require 'rails_helper'

RSpec.describe 'users', type: :request do
	let(:user) { create :user }

	before(:each) { sign_in user }

	context 'index' do
		it 'render with 200 status' do
			get "/users"
			expect(response).to be_success
		end
	end
end
