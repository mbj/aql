module AQL
  class Node
    class Literal
      # Literal number node
      class Number < self
        include Composition.new(:number)

      private

        # Emit aql
        #
        # @param [Buffer] buffer
        #
        # @return [undefined]
        #
        # @api private
        #
        def emit(buffer)
          buffer.append(number)
        end

      end
    end
  end
end
