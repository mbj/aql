module AQL
  class Node
    class Operator
      # Base class for n-ary operators
      class Nary < self
        include Composition.new(:body)

      private

        # Emit node
        #
        # @return [undefined]
        #
        # @api private
        #
        def emit(buffer)
          body = self.body
          if body.length == 1
            body.first.visit(buffer)
            return
          end
          emit_body(buffer)
        end

        # Emit body
        #
        # @rteturn [undefined]
        #
        # @api private
        #
        def emit_body(buffer)
          buffer.parentheses do
            buffer.delimited(body, " #{self.class::SYMBOL} ")
          end
        end

        # Nary and operator
        #
        # Only present to ease generation of join filters.
        #
        class And < self
          SYMBOL = :'&&'
        end

      end
    end
  end
end
