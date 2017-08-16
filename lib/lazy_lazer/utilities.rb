# frozen_string_literal: true

module LazyLazer
  # Utility methods.
  module Utilities
    # Transforms a value using a "transformer" supplied using :with.
    # @param [Object] value the value to transform
    # @param [nil, Symbol, Proc] transformer the transformation method
    # @param [Object] context the context to run the proc in
    # @param [Object] the result of applying the transformation to the value
    def self.transform_value(value, transformer, context)
      case transformer
      when nil
        value
      when Symbol
        value.public_send(transformer)
      when Proc
        context.instance_exec(value, &transformer)
      end
    end
  end
end
