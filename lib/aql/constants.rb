module AQL
  # The list of AQL keywords from https://github.com/triAGENS/ArangoDB/wiki/Aql#wiki-1AqlKeywords
  # Linking GH as the arangodb.org version does not have a anchors :(
  KEYWORDS = IceNine.deep_freeze(%w(
    FOR
    RETURN
    FILTER
    SORT
    LIMIT
    LET
    COLLECT
    ASC
    DESC
    IN
    INTO
    NULL
    TRUE
    FALSE
  ).to_set)
end
