require 'rails_helper'

RSpec.describe "admin/syllabuses/edit", type: :view do
  before(:each) do
    @admin_syllabus = assign(:admin_syllabus, Admin::Syllabus.create!())
  end

  it "renders the edit admin_syllabus form" do
    render

    assert_select "form[action=?][method=?]", admin_syllabus_path(@admin_syllabus), "post" do
    end
  end
end
