module AQL
  class Node
    class Operator
      # Assignment operator
      class Assignment < self
        include Composition.new(:name, :value)
        SYMBOL = :'='

      private

        # Emit into buffer
        #
        # @param [Buffer] buffer
        #
        # @return [undefined]
        #
        # @api private
        #
        def emit(buffer)
          name.visit(buffer)
          buffer.append(" #{SYMBOL} ")
          value.visit(buffer)
        end
      end
    end
  end
end

