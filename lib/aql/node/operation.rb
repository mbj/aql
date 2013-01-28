module AQL
  class Node
    # Base class for operations
    class Operation < self

    private

      # Return operation
      class Return < self
        include Composition.new(:expression)

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
          buffer.append('RETURN ')
          expression.visit(buffer)
        end

      end

    end
  end
end
