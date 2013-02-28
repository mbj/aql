module AQL
  # The list of AQL keywords from http://www.arangodb.org/manuals/current/Aql.html#AqlKeywords
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
