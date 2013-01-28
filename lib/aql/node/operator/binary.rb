module AQL
  class Node
    class Operator
      # Base class for binary operators
      class Binary < self
        include Composition.new(:left, :right)

      private

        # Emit node
        #
        # @return [undefined]
        #
        # @api private
        #
        def emit(buffer)
          buffer.binary(left, operator, right)
        end

        # Binary equality operator
        class Equality
          SYMBOL = :==
        end

        # Binary inequality operator
        class Inequality
          SYMBOL = :'!='
        end

        # Binary or operator
        class Or
          SYMBOL = :'||'
        end

        # Binary and operator
        class And
          SYMBOL = :'&&'
        end

        # Binary in operator
        class In
          SYMBOL = :'IN'
        end

        # Binary less than operator
        class LessThan
          SYMBOL = :'<'
        end

        # Binary less than or equal to operator
        class LessThanOrEqualTo
          SYMBOL = :'<='
        end

        # Binary greater than operator
        class GreaterThan
          SYMBOL = :'>'
        end

        # Binary greater than or equal to operator
        class GreaterThanOrEqualTo
          SYMBOL = :'>='
        end

        # Binary addition operator
        class Addition
          SYMBOL = :+
        end

        # Binary substraction operator
        class Substraction
          SYMBOL = :-
        end

        # Binary multiplication operator
        class Multiplication
          SYMBOL = :*
        end

        # Binary division operator
        class Division
          SYMBOL = :/
        end

        # Binary modulo operator
        class Modulo
          SYMBOL = :%
        end
      end
    end
  end
end
