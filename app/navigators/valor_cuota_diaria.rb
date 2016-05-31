class ValorCuotaDiaria < Crabfarm::BaseNavigator
  def run
    base_url = 'http://www.aafm.cl/estadisticas_publico/valor_cuota_diaria.php?consulta=4&'

    params[:administradora] = '%' unless params.key? :administradora
    params[:tipo] = '%' unless params.key? :tipo
    params[:inversion] = 'N' unless params.key? :inversion

    browser.goto base_url+params.to_query
    reduce_with_defaults
  end
end