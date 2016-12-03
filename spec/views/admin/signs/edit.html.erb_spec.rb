require 'rails_helper'

RSpec.describe "admin/signs/edit", type: :view do
  before(:each) do
    @admin_sign = assign(:admin_sign, Admin::Sign.create!())
  end

  it "renders the edit admin_sign form" do
    render

    assert_select "form[action=?][method=?]", admin_sign_path(@admin_sign), "post" do
    end
  end
end
