module AQL
  class Node
    # Generic AQL object name
    class Name < self
      include Composition.new(:name)

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
      #   quoted string, if needed 
      #
      # @api private
      #
      def quoted_name
        local = name
        if keyword? 
          %Q(`#{local}`) 
        else
          local
        end
      end

      # Test if name is keyword
      #
      # @return [true]
      #   if name is keyword
      #
      # @return [false]
      #   otherwise
      #
      # @api private
      #
      def keyword?
        KEYWORDS.include?(name.upcase)
      end

    end
  end
end
