class Boolean
  def self.parse(value)
    ActiveModel::Type::Boolean.new.cast value
  end
end