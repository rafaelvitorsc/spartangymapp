class UsersBackoffice::TrainingsController < UsersBackofficeController
    before_action :set_training, only: [:edit, :update, :destroy]
    
    
    def index
      @trainings = Training.all.order(:id).page(params[:page]).per(10)
    end
  
    def new
      @training = Training.new
    end
  
    def create
      @training = Training.new(params_training)
      if @training.save
        redirect_to users_backoffice_trainings_path, notice: "Treino criado com sucesso"
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @training.update(params_training)
        redirect_to users_backoffice_trainings_path, notice: "Treino atualizado com sucesso"
      else
        render :edit
      end
    end
  
    def destroy
      if @training.destroy
        redirect_to users_backoffice_trainings_path, notice: "Treino excluído com sucesso"
      else
        render :index
      end
    end
  
    private
  
    def params_training
      params.require(:training).permit(:description, :name)
    end
  
    def set_training
      @training = Training.find(params[:id])
    end
end
