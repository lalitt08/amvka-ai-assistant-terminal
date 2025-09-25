# 🚀 Publishing Amvka to PyPI

This guide will help you publish amvka so users can install it with `pip install amvka`.

## 📋 Prerequisites

1. **Python 3.7+** installed
2. **PyPI account** - Sign up at https://pypi.org/account/register/
3. **TestPyPI account** (optional but recommended) - Sign up at https://test.pypi.org/account/register/

## 🔧 Step 1: Install Required Tools

```bash
pip install --upgrade pip setuptools wheel twine build
```

## 📝 Step 2: Update Project Information

### 2.1 Update `setup.py`
Make sure your `setup.py` has correct information:

```python
# Update these fields in setup.py:
author="Lalit Sangore",
author_email="lgsangore2002@gmail.com",
url="https://github.com/lalitt08/amvka",  # Your actual GitHub repo
```

### 2.2 Create/Update `pyproject.toml` (Modern Python Packaging)

```toml
[build-system]
requires = ["setuptools>=45", "wheel", "setuptools_scm[toml]>=6.2"]
build-backend = "setuptools.build_meta"

[project]
name = "amvka"
dynamic = ["version"]
description = "Convert natural language to shell commands using AI"
readme = "README.md"
license = {text = "MIT"}
authors = [
    {name = "Lalit Sangore", email = "lgsangore2002@gmail.com"}
]
classifiers = [
    "Development Status :: 4 - Beta",
    "Intended Audience :: Developers", 
    "Intended Audience :: System Administrators",
    "License :: OSI Approved :: MIT License",
    "Operating System :: OS Independent",
    "Programming Language :: Python :: 3",
    "Programming Language :: Python :: 3.7",
    "Programming Language :: Python :: 3.8", 
    "Programming Language :: Python :: 3.9",
    "Programming Language :: Python :: 3.10",
    "Programming Language :: Python :: 3.11",
    "Programming Language :: Python :: 3.12",
    "Topic :: System :: Shells",
    "Topic :: Utilities",
]
requires-python = ">=3.7"
dependencies = [
    "requests>=2.31.0",
    "google-generativeai>=0.3.0", 
    "openai>=1.0.0",
    "click>=8.0.0",
    "colorama>=0.4.0"
]

[project.urls]
Homepage = "https://github.com/yourusername/amvka"
Repository = "https://github.com/yourusername/amvka"
Issues = "https://github.com/yourusername/amvka/issues"
Documentation = "https://github.com/yourusername/amvka/blob/main/README.md"

[project.scripts]
amvka = "amvka.cli:main"

[tool.setuptools_scm]
write_to = "src/amvka/_version.py"
```

## 📖 Step 3: Create a Great README.md

```markdown
# 🎯 Amvka - AI Command Assistant

> No more memorizing commands! Just tell me what you want to do.

## 🚀 Quick Start

```bash
pip install amvka
```

### Setup
```bash
amvka config  # Set up your API key (OpenAI or Google Gemini)
```

### Usage
```bash
amvka "show me all Python files"
amvka "check if Docker is running" 
amvka "create a backup of this directory"
amvka "kill process on port 3000"
```

## ✨ Features

- 🧠 **AI-Powered**: Converts natural language to shell commands
- 🔒 **Safe**: Built-in safety checks prevent dangerous operations  
- 🌍 **Cross-Platform**: Works on Windows, macOS, and Linux
- 🎛️ **Multiple LLMs**: Supports OpenAI GPT and Google Gemini
- 💬 **Conversational**: Handles greetings, help requests, and clarifications

## 📋 Requirements

- Python 3.7+
- OpenAI API key OR Google Gemini API key

## 🔧 Configuration

First time setup:
```bash
amvka config
```

Show current config:
```bash
amvka config --show
```

Reset configuration:
```bash
amvka config --reset
```

## 📝 License

MIT License - see LICENSE file for details.
```

## 🔒 Step 4: Create License File

```text
MIT License

Copyright (c) 2025 Lalit Sangore

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## 🔥 Step 5: Build and Test Locally

### 5.1 Clean Previous Builds
```bash
rm -rf dist/ build/ *.egg-info/
```

### 5.2 Build the Package
```bash
python -m build
```

This creates files in `dist/`:
- `amvka-1.0.0.tar.gz` (source distribution)
- `amvka-1.0.0-py3-none-any.whl` (wheel distribution)

### 5.3 Test Installation Locally
```bash
pip install dist/amvka-1.0.0-py3-none-any.whl
amvka "hello"  # Test it works
pip uninstall amvka  # Clean up
```

## 🧪 Step 6: Upload to TestPyPI (Recommended)

### 6.1 Configure TestPyPI credentials
```bash
twine configure
# Or create ~/.pypirc manually
```

### 6.2 Upload to TestPyPI
```bash
twine upload --repository testpypi dist/*
```

### 6.3 Test Installation from TestPyPI
```bash
pip install --index-url https://test.pypi.org/simple/ --extra-index-url https://pypi.org/simple/ amvka
amvka "test command"
pip uninstall amvka
```

## 🌟 Step 7: Publish to PyPI

### 7.1 Upload to PyPI
```bash
twine upload dist/*
```

### 7.2 Verify Installation
```bash
pip install amvka
amvka --version
```

## 🎉 Step 8: Post-Publication

### 8.1 Create GitHub Release
1. Go to your GitHub repo
2. Click "Releases" → "Create a new release"
3. Tag: `v1.0.0`
4. Title: `Amvka v1.0.0 - AI Command Assistant`
5. Description: Feature highlights

### 8.2 Update Documentation
- Add installation instructions
- Create examples and tutorials
- Set up GitHub Pages (optional)

### 8.3 Promote Your Package
- Share on social media
- Post on Reddit (r/Python, r/commandline)
- Add to awesome lists
- Write blog posts

## 📈 Maintenance

### Version Updates
1. Update version in `setup.py` or use `setuptools_scm`
2. Update CHANGELOG.md
3. Build and upload new version
4. Create GitHub release

### Monitoring
- Monitor PyPI download stats
- Watch GitHub issues/PRs
- Respond to user feedback

## 🆘 Common Issues

### Issue: "Package already exists"
**Solution**: Version numbers must be unique. Increment version in `setup.py`.

### Issue: "Invalid credentials"  
**Solution**: Check your PyPI username/password or use API tokens.

### Issue: "Package description invalid"
**Solution**: Ensure README.md is properly formatted and encoded as UTF-8.

### Issue: "Missing files"
**Solution**: Check MANIFEST.in includes all necessary files.

---

## 🎯 Quick Commands Summary

```bash
# Install tools
pip install --upgrade pip setuptools wheel twine build

# Build package  
python -m build

# Test upload
twine upload --repository testpypi dist/*

# Production upload
twine upload dist/*

# Test installation
pip install amvka
```

**🚀 Ready to make amvka available to the world!**