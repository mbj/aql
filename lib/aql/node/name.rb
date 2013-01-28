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
        buffer.append(emittable_name)
      end

      # Return emittable name
      #
      # @return [String]
      #   quoted string, if needed 
      #
      # @api private
      #
      def emittable_name
        if keyword? 
          quoted_name
        else
          name
        end
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