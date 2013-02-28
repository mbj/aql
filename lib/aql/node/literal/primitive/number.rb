module AQL
  class Node
    class Literal
      class Primitive
        # Literal number node
        class Number < self
          handle(Float)
          handle(Fixnum)

        private

          # Emit AQL
          #
          # @param [Buffer] buffer
          #
          # @return [undefined]
          #
          # @api private
          #
          def emit(buffer)
            buffer.append(value.to_s)
          end

        end
      end
    end
  end
end
