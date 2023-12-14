class UsersBackoffice::FrequenciesController < UsersBackofficeController
    before_action :set_frequency, only: [:edit, :update, :destroy]
    
    
    def index
      @frequencies  = Frequency.all.order(:id).page(params[:page]).per(10)
    end
  
    def new
      @frequency = Frequency.new
    end
  
    def create
      @frequency = Frequency.new(params_frequency)
      if @frequency.save
        redirect_to admins_backoffice_welcome_index_path, notice: "Frequência criada com sucesso"
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @frequency.update(params_frequency)
        redirect_to users_backoffice_frequencies_path, notice: "Frequência atualizada com sucesso"
      else
        render :edit
      end
    end
  
    def destroy
      if @frequency.destroy
        redirect_to users_backoffice_frequencies_path, notice: "Frequência excluída com sucesso"
      else
        render :index
      end
    end
  
    private
  
    def params_frequency
      params.require(:frequency).permit(:data, :turno, :treino)
    end
  
    def set_frequency
      @frequency = Frequency.find(params[:id])
    end
end
