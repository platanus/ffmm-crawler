class ValorCuotaDiariaReducer < Crabfarm::BaseReducer
  has_field :share_values

  def run
    self.share_values = Array.new
    share_values_tr_list.elements.drop(1).each do |elem|
      row_data = elem.search("td")
      next if row_data.count<6 || row_data[1].text.blank?
      share_value = ShareValue.new
      share_value.institution = row_data[0].text
      share_value.run = row_data[1].text
      share_value.fund = row_data[2].text
      share_value.serie = row_data[3].text
      share_value.value = row_data[5].text.delete('.').sub(',','.').to_f
      share_value.date = "#{params[:anio]}-#{params[:mes]}-#{params[:dia]}"
      share_values << share_value
    end
  end

  private

  def share_values_tr_list
    @share_values_tr_list ||= search("table tbody:nth-child(2) tr")
  end
end

