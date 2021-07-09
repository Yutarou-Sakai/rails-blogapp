class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update]

    def index
        @articles = Article.all
    end

    def show
        # id を取得して記事情報を表示
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        if @article.save
            redirect_to article_path(@article), notice: '保存ができました'
        else
            flash.now[:error] = '保存できませんでした'
            render :new
        end
    end

    def edit
        # id を取得して記事情報を取得
    end

    def update
        # id を取得して記事を特定し、内容を更新
        if @article.update(article_params)
            redirect_to article_path(@article), notice: '更新できました'
        else
            flash.now[:error] = '更新できませんでした'
            render :edit
        end
    end

    def destroy
        article = Article.find(params[:id])
        article.destroy! #!マークで例外ができる
        redirect_to root_path, notice: '削除しました'
    end

    private
    def article_params #フォームの入力内容
        params.require(:article).permit(:title, :content)
    end

    def set_article
        @article = Article.find(params[:id])
    end
end