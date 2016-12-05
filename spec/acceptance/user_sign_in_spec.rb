require 'acceptance_helper'

resource "学员注册登录" do
  header "Accept", "application/json"

  post "/users/sign_in" do

    before do
      @user = create(:user)
    end

    parameter :email, "登录的邮箱", required: true, scope: :user
    parameter :password, "登录密码", required: true, scope: :user
    
    user_attrs = FactoryGirl.attributes_for :user
    let(:email) { user_attrs[:email] }
    let(:password) { user_attrs[:password] }

    response_field :id, "学员ID"
    response_field :email, "邮箱"
    response_field :created_at, "创建时间"
    response_field :updated_at, "更新时间"
    response_field :authentication_token, "鉴权Token"

    example "学员登录成功" do
      do_request
      puts response_body
      expect(status).to eq(201)
    end

  end
end