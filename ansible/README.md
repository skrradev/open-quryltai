# Ansible — Hetzner server bootstrap

Bootstraps a fresh Hetzner server, reusing the role-based playbook from
`~/projects/ansible/hetzner`.

## Roles (`server-bootstrap.yml`)
- `timezone` — system timezone
- `user_management` — create the sudo deploy user from env vars, authorize SSH key
- `tailscale` — install Tailscale and join the tailnet (uses `TAILSCALE_AUTH_KEY`)
- `firewall` — UFW (default-deny incoming; allow 22/80/443 + Tailscale) and fail2ban

`ssh_hardening` runs in a **separate** playbook (`ssh-hardening.yml`) — see step 2.

## Run (two steps)

Prep once:
```bash
cd ansible
cp .env.example .env            # fill in values (never commit .env)
set -a && source .env && set +a
```
The Hetzner SSH key lives in `../.secrets/` (git-ignored); its public half goes
in `APP_SERVER_PUBLIC_KEY`. The server IP is set in the inventory.

### Step 1 — bootstrap (as root)
Creates the deploy user, Tailscale, and firewall. Leaves root SSH working.
```bash
ansible-playbook -i inventories/prod/inventory-server-bootstrap.ini server-bootstrap.yml
```

### Checkpoint — verify deploy access BEFORE hardening
```bash
ssh -i ../.secrets/hetzner_deploy "$ANSIBLE_USERNAME"@quryltai-server 'echo ok; sudo -n true && echo sudo-ok'
```
If that works you cannot get locked out — Tailscale SSH is also a fallback.

### Step 2 — harden SSH (as the deploy user)
Disables root login and password auth. Run only after the checkpoint passes.
```bash
ansible-playbook -i inventories/prod/inventory-server-bootstrap.ini ssh-hardening.yml \
  -u "$ANSIBLE_USERNAME" --become
```
