# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2025-09-29 - "Universal Intelligence Release"

### 🚀 **Major Release - Complete Architecture Overhaul**

This release represents a fundamental transformation of AMVKA into a universal AI-powered assistant with support for 100+ AI providers and intelligent dual-mode operation.

### ✨ **Added - Universal AI Provider Support**
- 🌐 **Universal Provider Interface**: Complete LangChain integration supporting 100+ AI providers
- 📡 **9 Core Providers**: OpenAI, Google Gemini, Anthropic Claude, Groq, Cohere, Azure OpenAI, AWS Bedrock, Ollama, HuggingFace
- 🔄 **Real-Time Model Discovery**: Live API calls to fetch current available models from provider endpoints
- 🎯 **Smart Model Filtering**: Intelligent filtering to show only working chat models (excludes TTS/Whisper/embedding models)
- ⚡ **Ultra-Fast Providers**: Groq integration for lightning-speed inference (sub-second responses)
- 🔗 **Connection Testing**: Automatic API key validation and model connectivity testing before configuration save

### 🧠 **Added - Intelligent Response System**
- 🤖 **Dual-Mode Operation**: 
  - **Command Mode**: Generates system commands for file operations, git, deployment, etc.
  - **Conversational Mode**: Direct AI responses for knowledge questions, explanations, help
- 💬 **Smart Query Classification**: Automatically determines whether to generate commands or provide conversational responses
- 🎯 **Enhanced Prompting**: Improved AI prompts for more accurate command generation and informative responses
- 🏷️ **Response Categories**: Structured handling for greetings, help requests, dangerous operations, and general queries

### 🔐 **Enhanced - Security & Safety**
- 🛡️ **Multi-Layer Model Filtering**:
  - Groq: Excludes `tts`, `whisper`, `embedding`, `guard`, `moderation`, `playai`
  - OpenAI: Excludes `tts`, `dall-e`, `whisper`, `embedding`, `moderation`
  - Gemini: Excludes `embedding`, `aqa` models, includes only chat-capable models
  - Cohere: Only models with 'chat' endpoints
- 🔄 **Fallback Model System**: Automatic retry with working models if primary model fails
- ✅ **Provider-Specific Validation**: Tailored safety checks for each AI provider
- 🚨 **Enhanced Dangerous Command Detection**: Expanded patterns for system protection

### 🛠️ **Enhanced - Configuration System**
- 🎛️ **Interactive Setup**: Guided configuration with real-time model discovery
- 📊 **Provider Comparison**: Display of speed, capabilities, and model counts during selection
- 🔍 **Live Model Fetching**: 
  - Gemini: Fetches 39+ current models from Google API
  - Groq: Fetches 20+ ultra-fast models with chat filtering
  - OpenAI: Live model list from OpenAI API
  - All providers: Real-time availability checking
- ⚙️ **Configuration Management**: Enhanced config display, reset, and testing options

### 🖥️ **Enhanced - Cross-Platform Support**  
- 💻 **Windows Enhancement**: Improved PowerShell command generation and environment detection
- 🐧 **Linux/macOS**: Enhanced bash/zsh command optimization
- 🔧 **Environment-Specific**: Commands tailored to detected shell and OS capabilities

### 📦 **Technical Improvements**
- 🏗️ **Pure LangChain Architecture**: Removed direct provider dependencies, using LangChain's universal interface
- 📄 **Clean Requirements**: Minimal core dependencies with optional provider packages
- 🔄 **Improved Error Handling**: Context-aware error messages with actionable solutions
- ⚡ **Performance Optimization**: Faster startup, efficient API calls, smart caching
- 🧪 **Comprehensive Testing**: Model filtering verification, provider connection testing

### 🐛 **Fixed**
- 🔑 **API Key Display Bug**: Fixed "Not set" display issue in configuration show
- 🚫 **Invalid Model Prevention**: Eliminated TTS/Whisper model selection that caused connection failures  
- 🔄 **Fallback Method Bug**: Fixed incorrect method call in fallback model system
- 📝 **Model Name Accuracy**: Updated default model names to current working versions

### 🔄 **Changed - Breaking Changes**
- 🏗️ **Architecture**: Migrated from direct provider APIs to LangChain universal interface
- 📦 **Dependencies**: Simplified requirements.txt to core + optional provider packages
- ⚙️ **Configuration Format**: Enhanced config structure for multi-provider support
- 🎯 **Prompt System**: Completely redesigned prompts for better dual-mode operation

### 📈 **Performance Improvements**
- ⚡ **Groq Integration**: Sub-second response times for supported models
- 🔄 **Smart Fallbacks**: Reduced failure rates through intelligent model switching
- 📡 **Efficient API Calls**: Optimized provider communication and caching
- 🎯 **Model Filtering**: Faster setup through pre-filtered model lists

### 🧪 **Development & Testing**
- ✅ **Model Filter Verification**: Comprehensive testing script for all provider filtering
- 🔍 **Connection Testing**: Automated API key and model validation
- 📊 **Provider Analytics**: Real-time model discovery and availability tracking
- 🛠️ **Development Tools**: Enhanced debugging and configuration testing utilities

## [1.0.0] - 2025-09-25

### Added
- 🎯 **Initial Release** - AI-powered command assistant
- 🤖 **Multi-LLM Support** - Google Gemini and OpenAI GPT integration
- 🔒 **Safety Features** - Built-in command validation and safety checks
- 💬 **Conversational Interface** - Handles greetings, help requests, and clarifications
- 🛡️ **Intelligent Command Detection** - Distinguishes between information queries and command requests
- ⚡ **Cross-Platform Support** - Works on Windows (PowerShell/CMD), macOS, and Linux
- 🎛️ **Configuration Management** - Easy setup and configuration system
- 🚀 **Natural Language Processing** - Converts plain English to shell commands

### Features
- Natural language to shell command conversion
- Interactive confirmation system with `--yes` flag for automation
- Dry-run mode with `--dry-run` flag
- Context-aware command suggestions
- Built-in help system
- Conversational AI responses for greetings and help requests
- Environment-specific command optimization
- Safety validation for dangerous operations
- Timeout protection for command execution
- Rich terminal output with colors and emojis

### Supported Commands
- File operations (list, create, delete, find, copy, move)
- System information (processes, memory, disk usage, network)
- Package management (install, update, search packages)
- Git operations (status, commit, push, pull, branch)
- Network operations (ping, port checking, connectivity)
- Text processing (search, replace, count, filter)
- Development tools (build, test, run, debug)

### Configuration
- Support for Google Gemini API
- Support for OpenAI GPT API  
- Configurable safety settings
- Model selection options
- API key management
- Configuration file at `~/.amvka/config.json`

### Safety & Security
- Command validation against whitelist
- Dangerous command pattern detection
- User confirmation for unknown operations
- Sandboxed execution environment
- Timeout protection (30 seconds default)
- No direct root access
- Secure API key storage

### Documentation
- Comprehensive README with examples
- Installation instructions for multiple methods
- Configuration guide
- Safety documentation
- Contributing guidelines
- PyPI publishing guide

---

## Future Releases

### Planned for v1.1.0
- [ ] Plugin system for custom commands
- [ ] Command history and favorites
- [ ] Shell completion support (bash/zsh/fish)
- [ ] Enhanced context awareness
- [ ] More AI provider integrations

### Planned for v1.2.0
- [ ] GUI version
- [ ] Command explanation mode
- [ ] Advanced safety configurations
- [ ] Team collaboration features
- [ ] Cloud synchronization

### Long-term Roadmap
- [ ] Local AI model support (offline mode)
- [ ] Integration with popular development tools
- [ ] Smart command suggestions based on project context
- [ ] Multi-language support
- [ ] Advanced scripting capabilities

---

## Development Notes

### Technical Stack
- **Language**: Python 3.7+
- **AI Integration**: Google Generative AI, OpenAI API
- **CLI Framework**: Custom implementation with argparse
- **Cross-Platform**: Works on Windows, macOS, Linux
- **Package Management**: Modern Python packaging with pyproject.toml

### Architecture
- **Modular Design**: Separate modules for LLM, execution, safety, configuration
- **Environment Detection**: Automatic OS and shell detection
- **Conversation Management**: Intelligent query classification and response handling
- **Safety Layer**: Multi-level validation and protection systems

### Quality Assurance
- Type hints throughout codebase
- Comprehensive error handling
- Input validation and sanitization
- Secure API key management
- Extensive testing coverage

## [1.0.1a1] - 2025-09-25 (Pre-release)

### Changed
- Version bumped to 1.0.1a1 for TestPyPI pre-release while resolving 403 authentication issues.
- Added GitHub Actions workflow for OIDC trusted publishing (`.github/workflows/publish.yml`).

### Added
- Pre-release distribution workflow validation; no runtime logic changes.

### Notes
- After successful TestPyPI validation this will be promoted to 1.0.1 stable.