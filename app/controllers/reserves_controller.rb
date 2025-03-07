class ReservesController < ApplicationController
  before_action :authenticate_user! # Deviseでログイン必須
  before_action :set_room, only: [:new, :create] #アクション前に部屋の情報読み込み

  def new
    @reserve = @room.reserves.build # buildはnewと同じ意味で、アソシエーションの際に使われる。
  end

  def create
    @reserve = @room.reserves.build(reserve_params) # 予約データ入力
    @reserve.user = current_user #ログイン中のユーザーデータの受け渡し

    if @reserve.save
      redirect_to reservations_user_path(@room), notice: "予約完了"
    else
      # 予約フォームでエラーが発生した場合、エラーメッセージを表示
      if @reserve.errors.any?
        redirect_to new_room_reserf_path(@room), alert:  "予約できませんでした。再入力をお願いいたします。" #reserves#new
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @reserve = Reserve.find(params[:id]) # 予約情報を取得
  
    if @reserve.user == current_user # 現在のユーザーの予約か確認
      @reserve.destroy
      redirect_to rooms_path, notice: "予約をキャンセルしました。"
    else
      redirect_to rooms_path, alert: "他のユーザーの予約は削除できません。"
    end
  end
  

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def reserve_params
    params.require(:reserve).permit(:check_in, :check_out, :people)
  end

end

