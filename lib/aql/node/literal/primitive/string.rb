module AQL
  class Node
    class Literal
      class Primitive
        # Literal string node
        class String < self
          handle(::String)

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
            buffer.append(value.inspect)
          end

        end
      end
    end
  end
end
