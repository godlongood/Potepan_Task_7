class UsersController < ApplicationController
  before_action :authenticate_user! # ログインが必要

  def reservations
    @reserves = current_user.reserves.includes(:room) # ユーザーの予約データを取得
  end
end

