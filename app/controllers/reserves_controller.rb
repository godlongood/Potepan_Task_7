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
      redirect_to room_path(@room), notice: "予約完了"
    else
      # 予約フォームでエラーが発生した場合、エラーメッセージを表示
      if @reserve.errors.any?
        redirect_to room_path(@room), alert:  "この部屋はすでに同じ日に予約されています。" #rooms#show
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def destroy
    
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def reserve_params
    params.require(:reserve).permit(:check_in, :check_out, :people)
  end

end

