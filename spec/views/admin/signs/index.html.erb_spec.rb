require 'rails_helper'

RSpec.describe "admin/signs/index", type: :view do
  before(:each) do
    assign(:admin_signs, [
      Admin::Sign.create!(),
      Admin::Sign.create!()
    ])
  end

  it "renders a list of admin/signs" do
    render
  end
end
