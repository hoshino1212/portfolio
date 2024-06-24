module Batch
    class RemindEvent
      def self.remaind_event
      events = Event.all
      events.each do |event|
        time_difference = (event.start_at - Time.now.in_time_zone("Tokyo")) / 3600 # AM9:00との時間差を時間単位で算出する
        if time_difference <= 39 && time_difference >= 15  && event.user.email_receiving_activation == true # 次の日のスケジュールなのかユーザーがリマインド機能をオンにしているかを判定
          RemaindEventMailer.creation_email(event).deliver_now # メールを送信するためのメソッド
          p "メールを#{event.user.name}に送信しました" # ログに表示するメッセージ
        end
        puts "Batch::RemindEvent.remaind_event is executed!"
      end
    end
end