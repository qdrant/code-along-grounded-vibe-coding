#!/bin/bash

# Run mcp-server-qdrant in read-only mode, so Cursor
# can use it to find relevant snippets
QDRANT_URL="http://localhost:6333" \
COLLECTION_NAME="qdrant-snippets" \
QDRANT_READ_ONLY="true" \
TOOL_FIND_DESCRIPTION="Search for relevant code snippets based on natural language descriptions. \
The 'query' parameter should describe what you're looking for, \
and the tool will return the most relevant code snippets. \
Use this when you need to find existing code snippets for reuse or reference." \
uvx mcp-server-qdrant --transport streamable-http # Enable SSE transport