require_relative '../test_helper'

describe ExpressionHelper do 

  describe '#grouping' do 
    it 'must surround block in parenthesis' do 
      ExpressionHelper.grouping {'pizza'}.must_equal '(pizza)'
    end
  end

  describe '#matching' do 
    it 'must combine array into pipe separated string' do 
      string = ExpressionHelper.matching ['pizza', 'cheeseburger']
      string.must_equal 'pizza|cheeseburger'
    end

    it 'must return string exactly' do 
      string = ExpressionHelper.matching 'pizza'
      string.must_equal 'pizza'
    end
  end

end