module AQL
  class Node
    # Generic AQL object name
    class Name < self
      include Concord.new(:name)

      # Return name
      #
      # @return [String]
      #
      # @api private
      #
      attr_reader :name

    private

      # Emit node
      #
      # @param [Buffer] buffer
      #
      # @return [undefined]
      #
      def emit(buffer)
        buffer.append(quoted_name)
      end

      # Return quoted name
      #
      # @return [String]
      #
      # @api private
      #
      def quoted_name
        %Q(`#{name}`)
      end

    end
  end
end
