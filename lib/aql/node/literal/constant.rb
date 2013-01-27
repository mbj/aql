module AQL
  class Node
    class Literal
      # Constant literal
      class Constant < self
        include Composition.new(:content)

      private

        # Emit content
        #
        # @return [undefined]
        #
        # @api private
        #
        def emit(buffer)
          buffer.append(content)
        end

        NULL  = new('null')
        FALSE = new('false')
        TRUE  = new('true')
      end
    end
  end
end
