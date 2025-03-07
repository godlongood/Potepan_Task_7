# app/controllers/users/sessions_controller.rb
class Users::SessionsController < Devise::SessionsController
  protected

  # Deviseのデフォルトのフラッシュメッセージの設定を変更
  def after_sign_in_path_for(resource)
    flash[:notice] = "ログインしました！"
    super
  end

  def after_sign_out_path_for(resource_or_scope)
    flash[:notice] = "ログアウトしました！"
    super
  end
end

