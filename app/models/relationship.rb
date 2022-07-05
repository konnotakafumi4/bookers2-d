class Relationship < ApplicationRecord
  # class_name: "User"でUserモデルを参照
  belongs_to :follower, class_name: "User" #クラスは頭文字は大文字
  belongs_to :followed, class_name: "User"

end
