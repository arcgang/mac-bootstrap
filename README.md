# Mac Bootstrap Playbook

An Ansible playbook to automate macOS development environment setup.

## Overview

This playbook configures a complete development environment including:
- Development tools and packages via Homebrew
- GUI applications (iTerm2, VS Code, Postman, Notion)
- Python development environment with pipx tools
- Node.js development setup
- Kubernetes tools (kubectl, Rancher Desktop)
- AI/ML stack (Ollama, Python libraries)
- macOS system preferences
- SSH configuration
- Chrome browser setup

## Prerequisites

1. **Install Homebrew**:
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. **Install Ansible**:
   ```bash
   brew install ansible
   ```

## Quick Start

1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd mac-bootstrap
   ```

2. Run the playbook:
   ```bash
   ansible-playbook -i inventory/localhost playbooks/mac.yml --ask-become-pass
   ```

3. Verify the installation:
   ```bash
   ./scripts/verify.sh
   ```

## Project Structure

```
mac-bootstrap/
├── ansible.cfg              # Ansible configuration
├── inventory/
│   └── localhost           # Local inventory file
├── playbooks/
│   └── mac.yml            # Main playbook
├── roles/                 # Ansible roles
│   ├── packages/          # Core Homebrew packages
│   ├── apps/              # GUI applications
│   ├── python/            # Python development tools
│   ├── node/              # Node.js setup
│   ├── kubernetes/        # Kubernetes tools
│   ├── ai-stack/          # AI/ML Python libraries
│   ├── vscode/            # VS Code extensions
│   ├── macos-settings/    # macOS system preferences
│   ├── chrome/            # Chrome browser
│   ├── iterm/             # iTerm2 configuration
│   ├── ssh/               # SSH setup
│   ├── git/               # Git configuration
│   ├── docker/            # Docker setup
│   └── adobe/             # Adobe applications
├── vars/                  # Variable files
│   ├── main.yml          # User configuration
│   ├── dev.yml           # Development packages
│   └── ai.yml            # AI/ML packages
└── scripts/
    └── verify.sh         # Installation verification
```

## Configuration

### User Settings
Edit `vars/main.yml` to customize user information:
```yaml
user_name: "Your Name"
user_email: "your.email@example.com"
```

### Package Lists
- `vars/dev.yml`: Core development packages
- `vars/ai.yml`: AI/ML specific packages

## What Gets Installed

### Development Tools
- Git, GitHub CLI
- curl, wget, httpie
- jq, yq (YAML/JSON processors)
- ripgrep, fd, bat (modern CLI tools)
- tmux, neovim, htop
- Terraform, Terragrunt
- Ansible

### GUI Applications
- iTerm2
- Visual Studio Code
- Postman
- Notion

### Python Environment
- Python 3 (via Homebrew)
- pipx for isolated package installation
- Jupyter Lab, Black, Ruff, MyPy
- AI libraries: langchain, llama-index

### AI/ML Stack
- Ollama (local LLM runner)
- LLVM, CMake, OpenBLAS
- Various Python AI libraries

### Kubernetes Tools
- kubectl
- Rancher Desktop

### macOS Customizations
- Show hidden files in Finder
- Faster key repeat rates
- Various system preferences

## Customization

### Adding Packages
Add packages to the appropriate variable files:
- `vars/dev.yml` for Homebrew packages
- `vars/ai.yml` for AI-specific packages

### Adding Roles
Create new roles in the `roles/` directory and include them in `playbooks/mac.yml`.

### Modifying Settings
Edit the tasks in `roles/macos-settings/tasks/main.yml` to customize system preferences.

## Troubleshooting

### Common Issues
1. **Permission denied**: Ensure you run with `--ask-become-pass`
2. **Homebrew not found**: Install Homebrew first
3. **VS Code extensions fail**: Ensure VS Code is installed and CLI is available

### Verification
Run the verification script to check if everything installed correctly:
```bash
./scripts/verify.sh
```

### Selective Execution
Run specific roles only:
```bash
ansible-playbook -i inventory/localhost playbooks/mac.yml --ask-become-pass --tags "python,vscode"
```

## Security Notes

- The playbook requires sudo access for some system modifications
- SSH keys and Git configuration are set up during execution
- Review all tasks before running in production environments

## Contributing

1. Test changes on a clean macOS system
2. Update this README if adding new features
3. Ensure the verification script covers new installations
4. Follow Ansible best practices for role organization

## License

Feel free to use and modify as per individual engineer requirements.