class UsersBackoffice::ProductsController < UsersBackofficeController
    before_action :set_product, only: [:edit, :update, :destroy]
    
    
    def index
      @products = Product.all.order(:id).page(params[:page]).per(10)
    end
  
    def new
      @product = Product.new
    end
  
    def create
      @product = Product.new(params_product)
      if @product.save
        redirect_to admins_backoffice_welcome_index_path, notice: "Produto criado com sucesso"
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @product.update(params_product)
        redirect_to users_backoffice_products_path, notice: "Produto atualizado com sucesso"
      else
        render :edit
      end
    end
  
    def destroy
      if @product.destroy
        redirect_to users_backoffice_products_path, notice: "Produto excluído com sucesso"
      else
        render :index
      end
    end
  
    private
  
    def params_product
      params.require(:product).permit(:description, :name)
    end
  
    def set_product
      @product = Product.find(params[:id])
    end
end
