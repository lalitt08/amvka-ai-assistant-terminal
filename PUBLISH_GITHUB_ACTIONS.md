# 🚀 Publishing to PyPI via GitHub Actions (Trusted Publishing)

This is the **recommended and most secure** way to publish your package. It eliminates the need for manual API tokens and the 403 authentication issues you've been experiencing.

## 📋 Prerequisites

1. **GitHub Repository**: Your code must be in a GitHub repository
2. **PyPI Account**: Account on both PyPI and TestPyPI
3. **Public Repository**: Trusted publishing requires public repos (or GitHub Pro)

## 🔧 Setup Steps

### 1. Push Your Code to GitHub

```bash
# Initialize git if not already done
git init
git add .
git commit -m "Initial release v1.0.1a1"

# Add your GitHub remote (replace with your actual repo)
git remote add origin https://github.com/lalitsangore/amvka.git
git branch -M main
git push -u origin main
```

### 2. Configure TestPyPI Trusted Publisher

1. Go to: https://test.pypi.org/manage/account/publishing/
2. Click "Add a new pending publisher"
3. Fill in:
   - **PyPI project name**: `amvka`
   - **Owner**: `lalitsangore` (your GitHub username)
   - **Repository name**: `amvka`
   - **Workflow name**: `publish.yml`
   - **Environment name**: Leave empty (optional)

### 3. Configure PyPI Trusted Publisher (for production)

1. Go to: https://pypi.org/manage/account/publishing/
2. Repeat the same process as TestPyPI

### 4. Create and Push a Pre-release Tag

```bash
# Create a pre-release tag (will publish to TestPyPI)
git tag v1.0.1a1
git push origin v1.0.1a1
```

### 5. Monitor the Action

1. Go to your GitHub repository
2. Click "Actions" tab
3. Watch the "Publish (PyPI / TestPyPI)" workflow run
4. It should automatically build and publish to TestPyPI

### 6. Create a Production Release

Once TestPyPI works:

1. Update version in `pyproject.toml` to `1.0.1` (remove `a1`)
2. Commit and push
3. Create production tag:
   ```bash
   git tag v1.0.1
   git push origin v1.0.1
   ```
4. This will publish to production PyPI

## 🎯 How the Workflow Works

The `.github/workflows/publish.yml` file automatically:

- **Pre-releases** (tags with `a`, `b`, `rc`): Publishes to TestPyPI
- **Releases** (clean version tags): Publishes to PyPI
- **Builds** both wheel and sdist
- **Validates** with `twine check`
- **Tests** installation after PyPI publish

## 🔍 Workflow Logic

```yaml
# Pre-release example: v1.0.1a1, v1.0.1b1, v1.0.1rc1 → TestPyPI
if: contains(github.ref, '-rc') || contains(github.ref, 'a') || contains(github.ref, 'b')

# Production example: v1.0.1, v2.0.0 → PyPI  
if: ${{ !contains(github.ref, '-rc') && !contains(github.ref, 'a') && !contains(github.ref, 'b') }}
```

## 🛡️ Security Benefits

- ✅ **No API tokens** stored in your environment
- ✅ **OIDC authentication** via GitHub's identity
- ✅ **Audit trail** in GitHub Actions logs
- ✅ **Automatic builds** ensure reproducibility
- ✅ **No credential leakage** risk

## 📦 Installation After Publishing

### From TestPyPI (pre-release)
```bash
pip install --no-cache-dir --index-url https://test.pypi.org/simple/ --extra-index-url https://pypi.org/simple amvka==1.0.1a1
```

### From PyPI (production)
```bash
pip install amvka
```

## 🚨 Troubleshooting

### "Resource not accessible by integration"
- Repository must be public for trusted publishing
- Check that workflow permissions include `id-token: write`

### "Could not find a matching distribution"
- Ensure the trusted publisher is configured correctly
- Project name in PyPI must exactly match your package name

### "Workflow not found"
- Push the `.github/workflows/publish.yml` file to your repo first
- Workflow name in trusted publisher must match exactly

## 🎉 Success Indicators

After tagging and pushing:

1. **GitHub Actions**: Green checkmark on the workflow
2. **TestPyPI**: Package appears at https://test.pypi.org/project/amvka/
3. **Installation**: `pip install` works from TestPyPI
4. **PyPI**: Production package at https://pypi.org/project/amvka/

## 🔄 Version Management

For future releases:

1. Bump version in `pyproject.toml`
2. Update `CHANGELOG.md`
3. Commit changes
4. Create and push tag
5. GitHub Actions handles the rest!

## 📞 Next Steps

1. **Push to GitHub** (if not already done)
2. **Configure trusted publishers** on both PyPI sites
3. **Tag and push** `v1.0.1a1` 
4. **Watch the magic happen** ✨

This method is now the industry standard and eliminates all the manual token headaches you've been experiencing!