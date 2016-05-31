class ValorCuotaDiaria < Crabfarm::BaseNavigator
  def run
    base_url = 'http://www.aafm.cl/estadisticas_publico/valor_cuota_diaria.php?consulta=4&'
    browser.goto base_url+params.to_query
    reduce_with_defaults
  end
end