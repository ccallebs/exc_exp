require_relative '../test_helper'

describe ExcEx do 
  before do 
    @exc_ex = ExcEx.new
  end

  describe '#matching' do 
    it 'must group generated matchers' do 
      string = @exc_ex.matching ['pizza', 'cheeseburgers']
      string.must_equal '(pizza|cheeseburgers)'
    end
  end

  describe '#any_number' do 
    it 'must append block with asterisk (*)' do 
      string = @exc_ex.any_number { 'pizza' }
      string[-1].must_equal '*'
    end
  end

  describe '#one_or_more' do 
    it 'must append block with plus sign (+)' do 
      string = @exc_ex.one_or_more { 'pizza' }
      string[-1].must_equal '+'
    end
  end

  describe '#exactly' do 
    it 'must append block with brackets and number of exact matches' do
      string = @exc_ex.exactly(2) { 'pizza' }
      string.must_equal 'pizza{2}'
    end
  end

  describe '#in_range' do 
    it 'must include both values passed in brackets' do 
      string = @exc_ex.in_range [3, 5] { 'pizza' }
      string.must_equal 'pizza{3,5}'
    end

    it 'must leave first element blank if nil is passed in' do 
      string = @exc_ex.in_range [nil, 5] { 'pizza' }
      string.must_equal 'pizza{,5}'
    end

    it 'must leave second element blank if nil is passed in' do 
      string = @exc_ex.in_range [3, nil] { 'pizza' }
      string.must_equal 'pizza{3,}'
    end
  end

end