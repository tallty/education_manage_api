require 'rails_helper'

RSpec.describe "admin/signs/show", type: :view do
  before(:each) do
    @admin_sign = assign(:admin_sign, Admin::Sign.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
