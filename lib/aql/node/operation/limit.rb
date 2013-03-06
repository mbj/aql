module AQL
  class Node
    class Operation
      # Limit operation
      class Limit < self
        KEYWORD = :LIMIT

        include Concord.new(:count, :offset)

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
          emit_offset(buffer)
          count.visit(buffer)
        end

        # Emit offset
        #
        # @param [Buffer] buffer
        #
        # @return [undefined]
        #
        # @api private
        #
        def emit_offset(buffer)
          local = offset || return
          local.visit(buffer)
          buffer.append(', ')
        end
      end
    end
  end
end
