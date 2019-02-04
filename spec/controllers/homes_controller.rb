require 'rails_helper'

RSpec.describe HomesController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end # describe "GET #index"
end
