module AQL
  class Node
    class Operation
      # Base class for binary operations
      class Binary < self
        include Composition.new(:left, :right)

        # Binary let operation
        class Let < self

          KEYWORD = :LET

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
            left.visit(buffer)
            buffer.append(' = ')
            right.visit(buffer)
          end
        end
      end
    end
  end
end
