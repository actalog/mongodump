# Mongodump

A GitHub Action to create MongoDB backups efficiently and securely, using `mongodump` with password-protected compression.

## Features

- 🛡️ **Secure Backups**: Password-protected compressed backups for enhanced data security.
- 🔄 **Simple Automation**: Automatically generate backups during CI/CD pipelines.
- 🚀 **Docker-Based**: Lightweight and easy to use.
- 📦 **Compatible with MongoDB 6**.

---

## Usage

### 1. Workflow Configuration

Add this Action to your GitHub workflow in the `.github/workflows/workflow.yml` file:

```yaml
name: Backup

on:
  schedule:
    - cron: 0 0 * * *

jobs:
  mongodump:
    name: Mongodump
    runs-on: ubuntu-latest
    steps:
      - uses: actalog/mongodump@v1
        with:
          connection-string: ${{ secrets.CONNECTION_STRING }}
          output-password: ${{ secrets.OUTPUT_PASSWORD }}
      - uses: actions/upload-artifact@v4
        with:
          name: dump
          path: ${{ github.workspace }}/dump
```

### 2. Action Inputs

| Parameter           | Required | Description                                         |
|---------------------|----------|-----------------------------------------------------|
| `connection-string` | Yes      | MongoDB connection URI (stored as a secret).        |
| `output-password`   | Yes      | Password to protect the backup file.                |

### 3. Setting Up Secrets

Add the following secrets to your GitHub repository:

1. **`CONNECTION_STRING`**: The connection URI for your MongoDB instance.
2. **`OUTPUT_PASSWORD`**: The password to secure the backup file.

---

## License

This project is licensed under the terms of [The Unlicense](./LICENSE).
