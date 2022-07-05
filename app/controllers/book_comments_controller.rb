class BookCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id]) #@bookに変更
    comment = current_user.book_comments.new(book_comment_params) #book.idも必要
    comment.book_id = @book.id #@bookに変更
    comment.save
    #redirect_to book_path(book)
  end

  def destroy
    @comment = BookComment.find(params[:id])
    @comment.destroy
    #BookComment.find(params[:id]).destroy #Book_Comment => BookCommentに変更
    #redirect_to book_path(params[:book_id])
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
