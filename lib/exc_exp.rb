require "./lib/exc_exp/version"
require './lib/expression_helper'

class ExcExp

  def initialize
    @regex_string = ''
  end

  def group
    "(#{yield})"
  end

  def matching args
    ExpressionHelper.grouping { ExpressionHelper.matching(args) }
  end

  def digits
    '\d'
  end

  def words
    '\w'
  end

  def any_number
    @regex_string += yield + "*"
  end

  def one_or_more
    @regex_string += yield + "+"
  end

  def exactly num
    @regex_string += yield + "{#{num}}"
  end

  def in_range range
    @regex_string += yield + "{#{range[0]},#{range[1]}}"
  end

  def match(string)
    to_regexp.match string
  end

  def to_regexp
    Regexp.new @regex_string
  end

  def to_s
    @regex_string
  end

  def self.build &block
    @this = ExcExp.new
    @this.instance_eval &block
    @this
  end

end
