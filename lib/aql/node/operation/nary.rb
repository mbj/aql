module AQL
  class Node
    class Operation
      # Base class for nary operations
      class Nary < self
        include Composition.new(:body)

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
          buffer.delimited(body)
        end

        # Filter operation
        class Sort < self
          KEYWORD = :SORT
        end

        # Collect operation
        class Collect < self
          KEYWORD = :COLLECT
        end

      end
    end
  end
end
