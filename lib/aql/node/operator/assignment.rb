module AQL
  class Node
    class Operator
      # Assignment operator
      class Assignment < self
        include Concord.new(:name, :value)
        SYMBOL = :'='

        # Return name
        #
        # @return [AQL] name
        #
        # @api private
        #
        attr_reader :name

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

