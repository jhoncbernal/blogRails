class Article < ApplicationRecord
    #La tabla no tenemos que relacionarla => articles
    #No definimos los campos=> article.title()=> El Titulo del articulo
    #no escribimos los metodos 
    belongs_to :user   
    validates :title, presence: true, uniqueness:true#validaciones
    validates :body, presence: true, length:{minimum:20}#validaciones

    before_save :set_visits_count

    def update_visits_count
        self.save if self.visits_count.nil?
        self.update(visits_count: self.visits_count + 1)         
    end

    private
    def set_visits_count
        self.visits_count ||=0;
        
    end
end
