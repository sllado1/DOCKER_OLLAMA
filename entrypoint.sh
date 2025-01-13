#!/bin/bash

echo "Starting Ollama server..."
ollama serve &
SERVE_PID=$!

echo "Waiting for Ollama server to be active... because if it is not, the pulls commands will fail."
while ! ollama list | grep -q 'NAME'; do
  sleep 1
done
echo "Ollama server is active!"
echo "Pulling models..."
ollama run tinyllama
#ollama pull llama3.2
#ollama pull llama3.2-vision

wait $SERVE_PID