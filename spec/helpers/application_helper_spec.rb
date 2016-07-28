require 'rails_helper'

class ApplicationHelperSpecTest < ActionDispatch::IntegrationTest
  describe "ApplicationHelper" do

    # let(:base_title) { "All app" }

    describe "full_title" do
      it "should include the page title" do
        expect(full_title("foo")).to match(/foo/)
      end

      it "should include the base title" do
        expect(full_title("foo")).to match(/All app/)
      end

      it "shouldn't include a bar for home page" do
        expect(full_title("")).not_to match(/\|/)
      end
    end
  end
end
