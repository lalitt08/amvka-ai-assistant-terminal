#!/bin/bash
# Build script for Amvka Debian package

set -e

echo "🚀 Building Amvka Debian Package"
echo "================================="

# Check if we're in the right directory
if [ ! -f "setup.py" ]; then
    echo "❌ Error: setup.py not found. Please run this script from the project root."
    exit 1
fi

# Check if required tools are installed
echo "📋 Checking build dependencies..."
command -v dpkg-buildpackage >/dev/null 2>&1 || {
    echo "❌ Error: dpkg-buildpackage not found. Please install:"
    echo "   sudo apt-get install build-essential debhelper dh-python"
    exit 1
}

# Clean previous builds
echo "🧹 Cleaning previous builds..."
rm -rf build/ dist/ *.egg-info/
rm -f ../amvka_*.deb ../amvka_*.dsc ../amvka_*.tar.* ../amvka_*.changes ../amvka_*.buildinfo

# Build the package
echo "🔨 Building Debian package..."
dpkg-buildpackage -us -uc

echo ""
echo "✅ Build completed successfully!"
echo ""
echo "📦 Generated files:"
ls -la ../amvka_*

echo ""
echo "📥 To install the package:"
echo "   sudo dpkg -i ../amvka_*.deb"
echo "   sudo apt-get install -f  # Fix any dependency issues"
echo ""
echo "🎉 Happy coding with Amvka!"