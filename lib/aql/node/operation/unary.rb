module AQL
  class Node
    class Operation
      # Base class for unary operations
      class Unary < self
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
          buffer.append("#{keyword} ")
          expression.visit(buffer)
        end

        # Return keyword
        #
        # @return [Symbol]
        #
        # @api private
        #
        def keyword
          self.class::KEYWORD
        end

        # Filter operation
        class Filter < self
          KEYWORD = :FILTER
        end

        # Return operation
        class Return < self
          KEYWORD = :RETURN
        end

      end
    end
  end
end
