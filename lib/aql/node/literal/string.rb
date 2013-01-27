module AQL
  class Node
    class Literal
      # Literal string node
      class String < self
        include Composition.new(:string)

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
          buffer.append(string.inspect)
        end

      end
    end
  end
end
