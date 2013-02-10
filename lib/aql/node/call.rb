module AQL
  class Node
    # AST node for function call
    class Call < self
      include Composition.new(:name, :arguments)

    private

      # Emit node
      #
      # @param [Buffer] buffer
      #
      # @return [undefined]
      #
      # @api private
      #
      def emit(buffer)
        buffer.append(name)
        buffer.wrap_delimited('(', arguments, ')')
      end

    end
  end
end
