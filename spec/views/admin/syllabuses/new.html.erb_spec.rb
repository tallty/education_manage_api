require 'rails_helper'

RSpec.describe "admin/syllabuses/new", type: :view do
  before(:each) do
    assign(:admin_syllabus, Admin::Syllabus.new())
  end

  it "renders new admin_syllabus form" do
    render

    assert_select "form[action=?][method=?]", admin_syllabuses_path, "post" do
    end
  end
end
