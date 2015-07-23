require 'rails_helper'

describe Settings do
  let(:private_key) { 'foo' }
  let(:config_hash) { { 'private_key' => private_key } }

  before do
    described_class.configure_from_hash(config_hash)
  end

  it 'loads private_key' do
    expect(described_class.private_key).to eq private_key
  end
end
