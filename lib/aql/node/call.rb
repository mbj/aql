module AQL
  class Node
    # AST node for function call
    class Call < self
      include Composition.new(:name, :arguments)

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
        buffer.append(name)
        buffer.parentheses do
          emit_arguments_with_for_check(buffer)
        end
      end

      # Emit arguments with for check
      #
      # Handles edge case described in https://github.com/triAGENS/ArangoDB/issues/399
      #
      # @param [Buffer] buffer
      #
      # @return [undefined]
      #
      # @api private
      #
      def emit_arguments_with_for_check(buffer)
        if for_argument?
          emit_arguments_with_extra_parentheses(buffer)
        else
          emit_arguments(buffer)
        end
      end

      # Emit arguments with parentheses
      #
      # @param [Buffer] buffer
      #
      # @return [undefined]
      #
      # @api private
      #
      def emit_arguments_with_extra_parentheses(buffer)
        buffer.parentheses { emit_arguments(buffer) }
      end

      # Test for `for` body
      #
      # @return [true]
      #   if an instance of Node::Operation::For is the only argument
      #
      # @return [false]
      #   otherwise
      #
      # @api private
      #
      def for_argument?
        local = arguments
        local.length == 1 and local.first.kind_of?(Operation::For)
      end

      # Emit arguments
      #
      # @param [Buffer] buffer
      #
      # @return [undefined]
      #
      # @api private
      #
      def emit_arguments(buffer)
        buffer.delimited(arguments)
      end

    end
  end
end
