module AQL
  class Node
    class Literal
      # Literal list node
      class List < self
        include Composition.new(:body)

        handle(Array)

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
          buffer.wrap_delimited('[', body, ']')
        end

        # Construct object
        #
        # @param [#each] object
        #
        # @return [Node::Literal::List]
        #
        # @api private
        #
        def self.construct(object)
          new(object.map do |item|
            Literal.build(item)
          end)
        end

      end
    end
  end
end

