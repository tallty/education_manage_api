require 'rails_helper'

RSpec.describe "admin/syllabuses/index", type: :view do
  before(:each) do
    assign(:admin_syllabuses, [
      Admin::Syllabus.create!(),
      Admin::Syllabus.create!()
    ])
  end

  it "renders a list of admin/syllabuses" do
    render
  end
end
