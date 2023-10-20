require 'rails_helper'

RSpec.describe "Projects", type: :request do
  #認証済みユーザー
  context "as authenticated user" do
    before do
      @user = FactoryBot.create(:user)
    end

    #有効な属性値の場合
    context "with valid attributes" do
      #プロジェクトを追加できること
      it "adds a project" do
        project_params = FactoryBot.attributes_for(:project)
        sign_in @user
        expect {
          post projects_path, params: { project: project_params }
        }.to change(@user.projects, :count).by(1)
      end
    end
  end
end