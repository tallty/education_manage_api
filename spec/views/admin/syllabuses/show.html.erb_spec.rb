require 'rails_helper'

RSpec.describe "admin/syllabuses/show", type: :view do
  before(:each) do
    @admin_syllabus = assign(:admin_syllabus, Admin::Syllabus.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
