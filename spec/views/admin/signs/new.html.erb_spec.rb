require 'rails_helper'

RSpec.describe "admin/signs/new", type: :view do
  before(:each) do
    assign(:admin_sign, Admin::Sign.new())
  end

  it "renders new admin_sign form" do
    render

    assert_select "form[action=?][method=?]", admin_signs_path, "post" do
    end
  end
end
