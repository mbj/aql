module AQL
  class Node
    class Literal
      class Composed
        # Literal document
        class Document < self
          handle(Hash)

          # Construct node from primitive
          #
          # @param [Hash] hash
          #
          # @return [Node::Literal::Document]o
          #
          # @api private
          #
          def self.construct(hash)
            new(hash.map do |key, value|
              Attribute.new(Literal.build(key), Literal.build(value))
            end)
          end

          # Literal document attribute
          class Attribute < Literal
            include Composition.new(:key, :value)

          private
            
            # Emit node
            #
            # @return [self]
            #
            # @api private
            #
            def emit(buffer)
              key.visit(buffer)
              buffer.append(': ')
              value.visit(buffer)
            end
          end

        private

          # Emit node
          #
          # @return [undefined]
          #
          # @api private
          #
          def emit(buffer)
            buffer.wrap_delimited('{', body, '}')
          end

        end
      end
    end
  end
end
