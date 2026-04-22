# gmailctl

`gmailctl` uses `~/.gmailctl` as its default config directory. This repo installs the `gmailctl` package, but does not manage `~/.gmailctl/config.jsonnet`.

The filter configuration is stored in Bitwarden Secrets Manager and must be materialized locally on each workstation.

## First-Time Setup

After applying the host configuration on a personal workstation:

1. Retrieve `config.jsonnet` from Bitwarden Secrets Manager.
2. Write it to `~/.gmailctl/config.jsonnet`.
3. Initialize Gmail access:

```bash
gmailctl init
```

This does not require the `gcloud` CLI. The setup flow uses Google's web-based OAuth flow and writes local auth state under `~/.gmailctl/`.

## Managed vs Local Files

- Repo-managed: `gmailctl` package installation only
- Bitwarden-managed: `~/.gmailctl/config.jsonnet`
- Local-only: OAuth credentials, tokens, and any other files created by `gmailctl init`

Do not commit `config.jsonnet` or generated auth files into this repository.

## Usage

Preview differences before applying changes:

```bash
gmailctl diff
```

Apply the current declarative filter config:

```bash
gmailctl apply
```

## Upstream Notes

- Default config location: `~/.gmailctl/config.jsonnet`
- `--config` exists as an override for alternate config directories
- Upstream discussion about migrating to XDG paths exists, but the default location remains `~/.gmailctl`
