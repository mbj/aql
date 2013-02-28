module AQL
  # Abstract base class for AQL nodes
  class Node
    include Adamantium, AbstractType

    # Return source representation
    #
    # @return [String]
    #
    # @api private
    #
    def aql
      emitter = Buffer.new
      emit(emitter)
      emitter.content
    end
    memoize :aql

    # Visit node
    #
    # @param [Buffer] buffer
    #
    # @return [self]
    #
    # @api private
    #
    def visit(buffer)
      emit(buffer)
      self
    end

  private

    # Emit AQL
    #
    # @param [Emitter] emitter
    #
    # @return [undefined]
    #
    # @api private
    #
    abstract_method :emit

  end
end
