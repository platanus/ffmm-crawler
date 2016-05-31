class ValorCuotaDiaria < Crabfarm::BaseNavigator
  def run
    base_url = 'http://www.aafm.cl/estadisticas_publico/valor_cuota_diaria.php?'

    query = {
      consulta: 4,
      administradora: params.fetch(:administradora, '%'),
      tipo: params.fetch(:tipo, '%'),
      inversion: params.fetch(:inversion, 'N'),
      anio: query_date.year,
      mes: query_date.month,
      dia: query_date.day
    }

    browser.goto base_url + query.to_query
    reduce_with_defaults
  end

  private

  def query_date
    @query_date ||= params[:fecha] ? Date.parse(params[:fecha]) : Time.now
  end
end