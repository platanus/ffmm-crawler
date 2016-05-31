require 'spec_helper'

describe ValorCuotaDiariaReducer do

  it "should extract correct share value", reducing: 'valor_cuota_diaria_snapshot' do
    expect(reducer.run.first.value).to eq 39781.54
  end
end
