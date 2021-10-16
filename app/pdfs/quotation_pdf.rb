class QuotationPdf < Prawn::Document
  def initialize(quotation)
    super()
    @quotation = quotation
    quotation_id

  end  

 
  def quotation_id
    move_down 20
    text "ciclONE", size: 30, style: :bold
    move_down 25
    text "Orçamento: #{@quotation.id}", size: 16, style: :bold
    move_down 30
    text "Cliente: #{@quotation.name}", style: :bold
    move_down 35
    text "Parcelas: #{@quotation.installments}", style: :bold
    move_down 40
    text "Valor: R$ #{@quotation.value.to_i}", style: :bold
  end
end