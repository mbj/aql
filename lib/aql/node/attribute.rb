module AQL
  class Node
    # Attribute node
    class Attribute < self
      include Composition.new(:target, :name)

    private

      # Emit attribute
      #
      # @param [Buffer] buffer
      #
      # @return [undefined]
      #
      # @api private
      #
      def emit(buffer)
        target.visit(buffer)
        buffer.append('.')
        name.visit(buffer)
      end

    end
  end
end
