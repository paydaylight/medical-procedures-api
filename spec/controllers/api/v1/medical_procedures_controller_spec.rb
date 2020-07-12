require "rails_helper"

RSpec.describe Api::V1::MedicalProceduresController, :type => :controller do
  describe "validation of GET search" do
    it "has a 400 status code when 'q' empty" do
      get :search, params: {p: "1"}
      expect(response.status).to eq(400)
      end

    it "has a 400 status code when 'p' empty" do
      get :search, params: {q: "test"}
      expect(response.status).to eq(400)
    end

    it "has a 400 status code when 'p' is not an integer" do
      get :search, params: {q: "test", p: "text"}
      expect(response.status).to eq(400)
    end

    it "has a 200 status code when 'p' is an integer" do
      get :search, params: {q: "test", p: "1"}
      expect(response.status).to eq(200)
    end
  end
end