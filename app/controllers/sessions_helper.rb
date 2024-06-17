module SessionsHelper
    #渡されたユーザーでログインする。
    #攻撃者がこの情報をcookiesから盗むことができたとしても、本物のユーザーとしてログインすることはできない。
    def log_in(user)
      #ユーザーのブラウザ内の一時cookiesに暗号済みのユーザーIDが自動で生成される。
      #session[:名前]により、名前をつけてセッションに登録できる。
      session[:user_id] = user.id
    end
  
    #セッションに含まれる現在のユーザーを検索する。
    def current_user
      #@current_user = @current_user || User.find_by(id:params[:user_id])
      if session[:user_id]
        @current_user ||= User.find_by(id:params[:user_id])
      end
    end
  
    #ユーザーがログインしていればtrue,そうでなければfalseを返す。
    def logged_in?
      #current_user.nil?がfalseの場合(すなわち・・・)にtrueとなる。
      !current_user.nil?
    end
  
    #ログイン中のユーザーをログアウトする.
    def log_out
      sessions.delete(:user_id)
      @current_user = nil
    end
  end