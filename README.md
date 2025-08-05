# Grounded Vibe Coding with Model Context Protocol and Qdrant

AI coding assistants are becoming increasingly popular, but we still take their output with a grain of salt. Vibe coding an app over a weekend is hard, but possible. Still, the quality of the generated code might be below expectations, as your applications may use outdated versions of the libraries - the ones the underlying LLM was trained on. That's where Qdrant's MCP server comes in handy, as it can act as a knowledge base, providing the right code examples just in time when you need them. Thanks to the Model Context Protocol, it integrates with the most popular AI coding assistants, including Cursor, Claude Code, and Windsurf.

In this code-along, Kacper Łukawski, a Senior Developer Advocate at Qdrant, will teach you how to rapidly build a Retrieval Augmented Generation system based on the Qdrant vector database. He will present an end-to-end setup for using your favourite AI coding assistant to speed development with the help of the MCP server that will be acting as a knowledge base for the libraries we will need, and how to use it to implement a RAG system faster than you ever could.

## Prerequisites

Please make sure to have the following tools installed on your machine:

- [uv](https://docs.astral.sh/uv/) - a Python package manager
- [Docker](https://www.docker.com/) - a platform for running applications in containers

You should follow the installation guidelines specific to your platform. For the most recent instructions, please refer to the tools' official websites.

Since this session focuses on AI-assisted coding, you also need a code editor that provides that functionality and supports MCP servers. Some of the most popular options include [Cursor](https://cursor.com), [Windsurf](Windsurf), [Claude Code](https://www.anthropic.com/claude-code), and [Augment Code](https://www.augmentcode.com/).

## Setting up the workspace

The following list of steps summarizes what has to be done in order to configure your AI coding assistant so you can follow our code-along session:

1. Open the AI code editor of your choice. 
2. Run Qdrant in a Docker container using the `scripts/01-run-qdrant-in-docker.sh` script.
3. Import the `snapshots/qdrant-snippets.snapshot` snapshot to a `qdrant-snippets` collection in the [Qdrant's Web UI](http://localhost:6333).
4. Run the [mcp-server-qdrant](https://github.com/qdrant/mcp-server-qdrant) using the `scripts/02-run-mcp-server-qdrant.sh` script.
5. Check the settings of the selected IDE to enable the MPC server usage.
6. Make sure your coding agent uses the rules specified. If you use Cursor, they should be applied automatically.

## Creating the application

Vibe coding with LLMs is hardly reproducible, so it's impossible to ensure a specific sequence of prompts will build the application correctly. However, the following list of prompts should take you close to our target solution:

### Basic application structure

```
Let's create a basic structure for a CLI application that will support two commands: 
1. Storing some information
2. Asking a question and getting answer to it
```

### Create a Qdrant connector class

```
We'll use Qdrant as a search backend. Let's create a new file for all the logic related to Qdrant. There should be a connector class that we'll iteratively build. Let's create it and add a constructor that will connect to Qdrant.
```

### Implement adding logic

```
Our connector should accept a collection name and the model used to vectorize the data. Extend the initializer.
```

### Use FastEmbed

```
I'll be using FastEmbed as a library for creating the vectors. Since we already have a model name, let's create a model instance in the connector initializer.
```

### Create store and search methods

```
Create store and search methods. Both should accept a string that we'll either save or use as a query. Use the same model for both.
```

### Connect to Qdrant in the app

```
Connect to Qdrant in the CLI app. Please use one of the available models, and assume you connect to local Qdrant running in a Docker container.
```

### Finalize the RAG pipeline

```
Please extend the ask_command function, so it takes the extracted texts and send them to Claude API along with the original question, so the model can answr it based on the facts from the database. Please use web search to find how to do that with Claude in Python.
```
