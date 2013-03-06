module AQL
  class Node
    class Operation
      # For operation
      class For < self
        include Concord.new(:local, :source, :body)

      private

        # Emit node
        #
        # @param [Buffer] buffer
        #
        # @return [self]
        #
        # @api private
        #
        def emit(buffer)
          buffer.append('FOR ')
          emit_local(buffer)
          emit_source(buffer)
          emit_body(buffer)
        end

        # Emit body
        #
        # @return [undefined]
        #
        # @api private
        #
        def emit_body(buffer)
          body.visit(buffer)
        end

        # Emit local
        #
        # @return [undefined]
        #
        # @api private
        #
        def emit_local(buffer)
          local.visit(buffer)
          buffer.append(' IN ')
        end

        # Emit source
        #
        # @return [undefined]
        #
        # @api private
        #
        def emit_source(buffer)
          local = source
          if local.kind_of?(Name)
            local.visit(buffer)
          else
            emit_source_parentheses(buffer)
          end
          buffer.append(' ')
        end

        # Emit source in parentheses
        #
        # @return [undefined]
        #
        # @api private
        #
        def emit_source_parentheses(buffer)
          buffer.parentheses do
            source.visit(buffer)
          end
        end

      end
    end
  end
end
