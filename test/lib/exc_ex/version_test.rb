require_relative '../../test_helper'

describe ExcEx do 
  it 'must be defined' do 
    ExcEx::VERSION.wont_be_nil
  end
end