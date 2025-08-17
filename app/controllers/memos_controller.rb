class MemosController < ApplicationController
  # ログインユーザーのみがメモ作成できる
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    # 修正: 全てのメモではなく、最新の3件のみを取得
    @memos = Memo.all.order(created_at: :desc).limit(3)
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
    @memo = Memo.find(params[:id]) 
  end

  def edit
    @memo = Memo.find(params[:id]) # 編集するメモを取得

  end

  def update
    @memo = Memo.find(params[:id]) # 更新するメモを取得
    if @memo.update(memo_params) # メモを更新
      redirect_to memo_path(@memo), notice: 'メモが正常に更新されました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @memo = Memo.find(params[:id]) # 削除するメモを取得
    @memo.destroy # メモを削除
    redirect_to root_path, notice: 'メモが正常に削除されました。' # 削除後にトップページへリダイレクト
  end

  def all_memos
    @all_memos = Memo.all.order(created_at: :desc)
  end

  def delete_image
    @image = ActiveStorage::Blob.find_signed(params[:id])
    @image.purge
    redirect_back(fallback_location: root_path, notice: '画像を削除しました。')
  end


  private

  # ストロングパラメーターの設定
  # フォームからの送信データを安全に受け取るために必要
  def memo_params
    params.require(:memo).permit(:mode, :title, :content, :error_content, :cause, :solution, :tag, :image)
  end
end
