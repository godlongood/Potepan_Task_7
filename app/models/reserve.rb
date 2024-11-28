class Reserve < ApplicationRecord
  belongs_to :user
  belongs_to :room

  #合計金額を表示
  def total_price
    return 0 unless check_in && check_out && people && room.price && 

    days = (check_out - check_in).to_i # 宿泊日数を計算
    days * people* room.price       # 宿泊日数 ×人数 x 1泊の料金
  end


  #必須項目
  validates :check_in, :check_out, :people, presence: true
  # チェックイン日が本日以降の日付
  validate :check_in_cannot_be_in_the_past #カスタムはprivate
  # チェックアウト日がチェックイン日より後の日付
  validate :start_end_over #カスタムはprivate

  # 人数が1人以上
  validates :people, numericality: { greater_than_or_equal_to: 1 }

  # 同じユーザーが同じ日に予約できないように
  validate :user_cannot_reserve_in_the_day #カスタムはprivate

  private
  #チェックイン日が本日以降の日付
  def check_in_cannot_be_in_the_past
    if check_in.present? && check_in < Date.today
      errors.add(:base, "本日以降の日付を選択してください")
    end
  end
  #開始日が終了日よりも後にならないように
  def start_end_over
    if self.check_in.present? && self.check_out.present? && self.check_in >= self.check_out #check_inとcheck_outはカラム名としてアクセスするため、self.check_inとself.check_outを使用し、dateのためpresent
      errors.add(:base, "チェックインはチェックアウト日より前でなければなりません") #:check_inだと、check_in開始日は終了日時より前でなければなりませんと表示されてしまうため、全体的なエラーメッセージとして表示
    end
  end
  #同じユーザーが同じ日に予約できないように
  def user_cannot_reserve_in_the_day
    # 同じ部屋、同じチェックイン日で、現在のユーザーの予約がすでに存在するか確認
    if Reserve.exists?(user_id: user.id, room_id: room.id, check_in: check_in)
      errors.add(:base, "同じ部屋を同じ日に予約することはできません") #コントローラ if @reserve.errors.any?
    end
  end

end
