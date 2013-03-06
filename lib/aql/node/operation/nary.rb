module AQL
  class Node
    class Operation
      # Base class for nary operations
      class Nary < self
        include Concord.new(:body)

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

        # FILTER operation
        class Sort < self
          KEYWORD = :SORT
        end

        # COLLECT operation
        class Collect < self
          KEYWORD = :COLLECT

          # COLLECT INTO operation
          class Into < self
            include Concord.new(:body, :name)

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
              super
              buffer.append(' INTO ')
              name.visit(buffer)
            end
          end
        end

      end
    end
  end
end
