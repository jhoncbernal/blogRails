class ArticlesController < ApplicationController
before_action :authenticate_user!, except: [:show,:index]
before_action :set_article , except: [:new,:create,:index]
#Obtiene todos los datos de la base de datos
#SELECT Article ALL
def index
    @articles = Article.all
    end

#Busca un valor por su ID
def show
    @article.update_visits_count
    @comment= Comment.new
end
#Crea un nuevo elemento en BD
def new
    @article = Article.new
end
def edit 
end 

def create
    @article = current_user.articles.new(title: params[:article][:title],
                       body: params[:article][:body])
        if @article.save                       
            redirect_to @article                       
        else
            render :new
        end
end

def update
     #@article.update_atributes({title:'Nuevo titulo'})  
    if @article.update(article_params)
        redirect_to @article
    else
        render :edit
    end
end 

#Elimina un elemento de BD
def destroy   
    @article.destroy# Destroy elimina el objeto de la base de datos 
    redirect_to articles_path
end

private

def set_article
    @article = Article.find(params[:id])
end
def article_params
    params.require(:article).permit(:title,:body)
end

def validate_user
    redirect_to new_user_session_path, notice: "Necesitas iniciar sesión"
end






end