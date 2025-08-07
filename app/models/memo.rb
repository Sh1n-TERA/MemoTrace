class Memo < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  # バリデーションの設定
  ## modeカラムとtagカラムは必須
  with_options presence: true do
    validates :mode
    validates :tag
  end

  ## mode 'normal'のバリデーション
  with_options if: -> { mode == 'normal' } do
    validates :title  , presence: true
    validates :content, presence: true
  end
  
  ## mode 'error'のバリデーション
  with_options if: -> { mode == 'error' } do
    validates :error_content, presence: true
    validates :cause        ,presence: true
    validates :solution     ,presence: true
  end

end
