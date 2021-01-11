class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comments = @post.comments.create(comment_params)
        redirect_to post_path(@post)
    end
    def destroy
        @post = Post.find(params[:post_id])
        @comments = @post.comments.destroy(comment_params)
    end

    private

    def comment_params
        params.require(:comment).permit(:username, :body)
    end
end
