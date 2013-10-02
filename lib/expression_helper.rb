class ExpressionHelper
  def self.grouping
    "(#{yield})"
  end

  def self.matching(args)
    if args.is_a? Array
      args.inject(''){ |mem, var| mem += "#{var}|" }.chop!
    else
      args
    end
  end
end
