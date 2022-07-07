class Book < ApplicationRecord
  belongs_to :user

  has_many :favorites, dependent: :destroy

  has_many :book_comments, dependent: :destroy

  has_many :view_counts, dependent: :destroy

  validates :title, presence:true
  validates :body, presence:true,length:{maximum:200}

  scope :created_today, -> { where(created_at: Time.zone.now.all_day) }
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) } # 前日

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @book = Book.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @book = Book.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @book = Book.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @book = Book.where("title LIKE?","%#{word}%")
    else
      @book = Book.all
    end
  end

  #サンプルコード
  #def self.search_for(content, method)
    #if method == 'perfect'
      #Book.where(title: content)
    #elsif method == 'forward'
      #Book.where('title LIKE ?', content+'%')
    #elsif method == 'backward'
      #Book.where('title LIKE ?', '%'+content)
    #else
      #Book.where('title LIKE ?', '%'+content+'%')
    #end
  #end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id) #favorites(お気に入り)が実在しているか？（user.id)
  end
end
