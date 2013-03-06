module AQL
  class Node
    class Operator
      # Base class for unary operators
      class Unary < self
        include Concord.new(:target)

      private

        # Emit node
        #
        # @return [undefined]
        #
        # @api private
        #
        def emit(buffer)
          buffer.append(operator)
          target.visit(buffer)
        end

        # Unary negation operator
        class Negation < self
          SYMBOL = :'!'
        end

        # Unary plus operator
        class Plus < self
          SYMBOL = :+
        end

        # Unary minus operator
        class Minus < self
          SYMBOL = :-
        end

      end
    end
  end
end
