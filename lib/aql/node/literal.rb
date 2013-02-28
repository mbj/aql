module AQL
  class Node
    # Abstract base class for literal nodes
    class Literal < self
      REGISTRY = {}

      # Register handler
      #
      # @param [Class] klass
      #
      # @return [undefined]
      #
      # @api private
      #
      def self.handle(klass)
        REGISTRY[klass]=self
      end
      private_class_method :handle

      # Build literal handler
      #
      # @param [Object] object
      #
      # @return [Node::Literal]
      #
      # @api private
      #
      def self.build(object)
        klass = object.class
        handler = REGISTRY.fetch(klass) do
          raise "No support for literal #{klass}"
        end
        handler.construct(object)
      end

      # Construct object
      #
      # @return [Node::Literal]
      #
      # @api private
      #
      def self.construct(*args)
        new(*args)
      end

    end
  end
end
