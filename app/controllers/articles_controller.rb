class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :categories_ids, only: [:create]

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def show
    end

    def edit
    end

    def create
        @article = Article.new(article_params)
        Article.add_categories(@article, categories_ids) if categories_ids.present?

        @article.user_id = current_user.id
        if @article.save
            redirect_to articles_path, notice: "Article was successfully created."
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        if @article.update(article_params)
            redirect_to article_path(@article), notice: "Article was successfully updated."
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @article.destroy
        redirect_to articles_path
    end

    private

    def article_params
        params.require(:article).permit(:name, :description, :avatar, :body)
    end

    def set_article
        @article = Article.find(params[:id])
    end

    def categories_ids
        params[:categories][:ids].reject { |id| id.empty? }
    end
end
