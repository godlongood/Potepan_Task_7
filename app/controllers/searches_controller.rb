class SearchesController < ApplicationController
  before_action :authenticate_user! # ログインが必要

  def search 
    if params[:word].blank?  # :word が空の場合
      @searches = Room.none   # 空の結果を設定
    else
      @searches = Room.looks(params[:search], params[:word]) # #Room.looksはroom.rb,paramsは、search.htmlから取得
    end
  end
end

