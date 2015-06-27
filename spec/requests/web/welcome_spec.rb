require 'rails_helper'

RSpec.describe 'welcome', type: :request do
	context 'index' do
		it 'render with 200 status' do
			get "/"
			expect(response).to be_success
		end
	end
end
