class UsersBackoffice::ShoppingsController < UsersBackofficeController
    before_action :set_shopping, only: [:edit, :update, :destroy]
    
    
    def index
      @shoppings = Shopping.all.order(:id).page(params[:page]).per(10)
    end
  
    def new
      @shopping = Shopping.new
    end
  
    def create
      @shopping = Shopping.new(params_shopping)
      if @shopping.save
        redirect_to admins_backoffice_welcome_index_path, notice: "Compra criada com sucesso"
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @shopping.update(params_shopping)
        redirect_to users_backoffice_shoppings_path, notice: "Compra atualizada com sucesso"
      else
        render :edit
      end
    end
  
    def destroy
      if @shopping.destroy
        redirect_to users_backoffice_shoppings_path, notice: "Compra excluída com sucesso"
      else
        render :index
      end
    end
  
    private
  
    def params_shopping
      params.require(:shopping).permit(:data, :value, :tipo)
    end
  
    def set_shopping
      @shopping = Shopping.find(params[:id])
    end
end

