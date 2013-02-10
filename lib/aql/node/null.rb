module AQL
  class Node
    # Null node that does not emit anything
    Null = Class.new(self) do

    private

      # Perform emit on buffer
      #
      # @param [Buffer] buffer
      #
      # @return [undefined]
      #
      # @api private
      #
      def emit(_buffer)
      end

    end.new
  end
end
