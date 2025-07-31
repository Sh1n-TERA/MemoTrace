class MemosController < ApplicationController
  # ログインユーザーのみがメモ作成できる
  before_action :authenticate_user!, only: [:new, :create]

  def index
  end

  def new
    @memo = Memo.new # 新しいMemoオブジェクト生成し、ビューに渡す
  end

  def create
    @memo = current_user.memos.build(memo_params) # 現ユーザーに紐付けてメモ作成
    if @memo.save
      redirect_to root_path, notice: 'メモが正常に作成されました。' # 成功したらトップページへリダイレクト
    else
      render :new, status: :unprocessable_entity # 失敗したら新規作成フォーム再表示
    end 
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  # ストロングパラメーターの設定
  # フォームからの送信データを安全に受け取るために必要
  def memo_params
    params.require(:memo).permit(:mode, :title, :content, :error_content, :cause, :solution, :tag, :image)
  end
end
