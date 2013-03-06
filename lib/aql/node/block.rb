module AQL
  class Node
    # Block of AQL statements
    class Block < self
      include Concord.new(:elements)

    private

      # Emit contents
      #
      # @param [Buffer] buffer
      #
      # @return [undefined]
      #
      # @api private
      #
      def emit(buffer)
        local = elements
        max = local.length - 1
        local.each_with_index do |element, index|
          element.visit(buffer)
          buffer.append(' ') if index < max
        end
      end

    end
  end
end
