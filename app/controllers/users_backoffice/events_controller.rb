class UsersBackoffice::EventsController < UsersBackofficeController
    before_action :set_event, only: [:edit, :update, :destroy]
    
    
    def index
      @events = Event.all.order(:id).page(params[:page]).per(10)
    end
  
    def new
      @event = Event.new
    end
  
    def create
      @event = Event.new(params_event)
      if @event.save
        redirect_to admins_backoffice_welcome_index_path, notice: "Evento criado com sucesso"
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @event.update(params_event)
        redirect_to users_backoffice_events_path, notice: "Evento atualizado com sucesso"
      else
        render :edit
      end
    end
  
    def destroy
      if @event.destroy
        redirect_to users_backoffice_events_path, notice: "Evento excluído com sucesso"
      else
        render :index
      end
    end
  
    private
  
    def params_event
      params.require(:event).permit(:description, :name)
    end
  
    def set_event
      @event = Event.find(params[:id])
    end
end
