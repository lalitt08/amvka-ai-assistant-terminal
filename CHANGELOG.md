# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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