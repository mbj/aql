module AQL
  class Node
    class Literal
      # Singleton literal
      class Singleton < self
        handle(NilClass)
        handle(TrueClass)
        handle(FalseClass)

        private_class_method :new

        include Composition.new(:content)

        # Construct object
        #
        # @param [Object] object
        #
        # @return [Node::Literal::Singleton]
        #
        # @api private
        #
        def self.construct(object)
          MAPPING.fetch(object)
        end

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

        MAPPING = {
          nil   => NULL,
          false => FALSE,
          true  => TRUE
        }

      end
    end
  end
end
