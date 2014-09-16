require 'spec_helper'

describe 'units' do
  let!(:client) { create_client }

  it 'can create a new unit' do
    unit = create_unit('name' => 'dude')
    expect(unit).to be
  end

  it 'can GET a list of units' do
    create_unit(
      'name' => 'faux_1',
    )
    create_unit(
      'name' => 'faux_2',
    )

    expect(client.units.all.count).to eq(2)
  end

  it "can show a unit" do
    unit = create_unit('name' => 'fred')
    name = unit['name']
    expect(client.units.get(name)).to be
  end
end
