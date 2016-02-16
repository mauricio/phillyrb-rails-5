class TagsType < ActiveModel::Type::Value

  def serialize(value)
    case value
      when Array
        value.join(',')
      else
        nil
    end
  end

  def cast_value(value)
    case value
      when String
        value.split(',').map(&:strip)
      when Array
        value
    else
      nil
    end
  end

end