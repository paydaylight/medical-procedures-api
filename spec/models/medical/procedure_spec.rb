# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Medical::Procedure, type: :model do
  context "Using PG text search" do
    QUERY_STRING = "surgical"

    before :each do
      create(:medical_procedure, name: "Surgicaly procedure")
      create(:medical_procedure, name: "Procedure surgical")
    end

    it "firstly returns entries for which the query matches the beginning of the word" do
      expect(Medical::Procedure.search(QUERY_STRING).first).to have_attributes name: "Surgicaly procedure"
    end

    it "then returns those entries where query string occurs" do
      expect(Medical::Procedure.search(QUERY_STRING).last).to have_attributes name: "Procedure surgical"
    end
  end
end
