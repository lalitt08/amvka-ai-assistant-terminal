#!/bin/bash
# Development installation script for Amvka

set -e

echo "🔧 Installing Amvka in development mode"
echo "======================================="

# Check Python version
python3 --version || {
    echo "❌ Error: Python 3 is required but not found."
    echo "Please install Python 3.7 or higher."
    exit 1
}

# Install dependencies
echo "📦 Installing Python dependencies..."
pip3 install -r requirements.txt

# Install in development mode
echo "⚙️  Installing Amvka in development mode..."
pip3 install -e .

echo ""
echo "✅ Installation completed successfully!"
echo ""
echo "🚀 To get started:"
echo "   1. Run 'amvka config' to set up your API key"
echo "   2. Try 'amvka show files here' to test the tool"
echo ""
echo "📖 For more information:"
echo "   amvka --help"