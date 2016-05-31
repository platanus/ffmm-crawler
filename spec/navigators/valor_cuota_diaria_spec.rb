require 'spec_helper'

describe ValorCuotaDiaria do

  it "should navigate to correct results page" do
    navigate administradora: '96767630', tipo: '%', dia: '1', mes: '2', anio: '2016', inversion: 'N'
    expect(browser.search('tbody:nth-child(2) tr:nth-child(2) td:nth-child(1)').text).to eq('BANCHILE')
  end

end
