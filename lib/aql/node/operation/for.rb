module AQL
  class Node
    class Operation
      # For operation
      class For < self
        KEYWORD = :FOR
        include Composition.new(:left, :right, :body)

      private

        # Emit node
        #
        # @param [Buffer] buffer
        #
        # @return [self]
        #
        # @api private
        #
        def emit(buffer)
          buffer.append("#{keyword} ")
          left.visit(buffer)
          buffer.append(' IN ')
          right.visit(buffer)
          buffer.append(' ')
          body.visit(buffer)
        end
      end
    end
  end
end
