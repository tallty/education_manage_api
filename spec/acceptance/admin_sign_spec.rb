require 'acceptance_helper'

resource "管理员 对学员签到 相关的API" do
  header "Accept", "application/json"

  ############### before_do ################################
  describe 'admin_sign condition is all correct' do
    admin_attrs = FactoryGirl.attributes_for(:admin)

    header "X-Admin-Token", admin_attrs[:authentication_token]
    header "X-Admin-Email", admin_attrs[:email]

    before do
      @admin = create(:admin)
      @admin_signs = create_list(:sign, 5, sign_time: Time.zone.now)
    end

  #################### index #############################
    get '/admin/signs' do

  	  parameter :page, "当前页", required: false
  	  parameter :per_page, "每页的数量", required: false
   
      let(:page) {1}
      let(:per_page) {6}

      example "管理员 查询 学员签到 列表 成功" do
        do_request
        puts response_body
        expect(status).to eq(200)
      end
    end

    ##################### show #############################
    get "/admin/signs/:id" do

  	  let(:id) {@admin_signs.first.id}

  	  example " 管理员 查询指定 学员签到 的详情成功" do
  	    do_request
  	    puts response_body
  	    expect(status).to eq(200)
  	  end
    end
  end
end