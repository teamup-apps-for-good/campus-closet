# frozen_string_literal: true

def find_or_create(model_class, attribute_value)
  model_class.find_by(name: attribute_value) || model_class.create(name: attribute_value)
end
