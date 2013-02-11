module AQL
  class Node
    class Operation
      # For operation
      class For < self
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
          buffer.append('FOR ')
          left.visit(buffer)
          buffer.append(' IN ')
          emit_right(buffer)
          buffer.append(' ')
          body.visit(buffer)
          buffer.append('')
        end

        # Emit right
        #
        # @return [undefined]
        #
        # @api private
        #
        def emit_right(buffer)
          if right.kind_of?(Name)
            right.visit(buffer)
          else
            emit_right_parantheses(buffer)
          end
        end

        # Emit right in parantheses
        #
        # @return [undefined]
        #
        # @api private
        #
        def emit_right_parantheses(buffer)
          buffer.parantheses do
            right.visit(buffer)
          end
        end

      end
    end
  end
end
