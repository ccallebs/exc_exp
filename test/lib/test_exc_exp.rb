require_relative '../test_helper'

describe ExcExp do 
  before do 
    @exc_exp = ExcExp.new
  end

  describe '#matching' do 
    it 'must group generated matchers' do 
      string = @exc_exp.matching ['pizza', 'cheeseburgers']
      string.must_equal '(pizza|cheeseburgers)'
    end
  end

  describe '#any_number' do 
    it 'must append block with asterisk (*)' do 
      string = @exc_exp.any_number { 'pizza' }
      string[-1].must_equal '*'
    end
  end

  describe '#one_or_more' do 
    it 'must append block with plus sign (+)' do 
      string = @exc_exp.one_or_more { 'pizza' }
      string[-1].must_equal '+'
    end
  end

  describe '#exactly' do 
    it 'must append block with brackets and number of exact matches' do
      string = @exc_exp.exactly(2) { 'pizza' }
      string.must_equal 'pizza{2}'
    end
  end

  describe '#in_range' do 
    it 'must include both values passed in brackets' do 
      string = @exc_exp.in_range [3, 5] { 'pizza' }
      string.must_equal 'pizza{3,5}'
    end

    it 'must leave first element blank if nil is passed in' do 
      string = @exc_exp.in_range [nil, 5] { 'pizza' }
      string.must_equal 'pizza{,5}'
    end

    it 'must leave second element blank if nil is passed in' do 
      string = @exc_exp.in_range [3, nil] { 'pizza' }
      string.must_equal 'pizza{3,}'
    end
  end

  describe '#build' do 
    it 'must return ExcExp object' do 
      ExcExp.build do 
      end.must_be_instance_of ExcExp
    end

    it 'must generate regex for all methods given' do 
      ExcExp.build do 
        any_number { matching 'pizza' }
        exactly(1) { matching 'cheeseburger' }
      end.to_s.must_equal '(pizza)*(cheeseburger){1}'
    end
  end

  describe '#to_regex' do 
    before do 
      @exc_exp = ExcExp.build do 
        any_number { matching '5' }
      end
    end

    it 'must return Regexp object' do 
      @exc_exp.to_regexp.must_be_instance_of Regexp
    end

    it 'should compare successfully to regex' do 
      '5'.match(@exc_exp.to_regexp).must_be_instance_of MatchData
    end
  end

  describe '#match' do 
    before do 
      @exc_exp = ExcExp.build do 
        any_number { matching '5' }
      end
    end

    it 'should compare successfully to string' do 
      @exc_exp.match('5').must_be_instance_of MatchData
    end
  end

end