class SalesController < ApplicationController
  def new
    @sale = Sale.new
  end

  def create
    details = params[:sale][:detail]
    category = params[:sale][:category]
    value = params[:sale][:value]
    discount = params[:sale][:discount].to_i
    exento_iva = (params[:sale][:iva] =='1')
    total = 0

    total = value * (1-(discount/100.0)

    sale = Sale.new

    if exento_iva == true
      sale.tax = 19
      total *= 1.19
    else
      sale.tax = 0
    end

    sale.detail = detail
    sale.discount = discount
    sale.value = value
    sale.total = total
    sale.category = category
    sale.cod = Datetime.now.to_i

    if sale.save
      redirect_to sales_done_path, notice:'EXITOOOOOO'
    else
      redirect_to root_path, notice:'Hubo un error al ingresar los registros'
    end
  end


  def done
    @sale = Sale.last
  end

end
end
