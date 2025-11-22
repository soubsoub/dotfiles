# MySQL Admin Toolkit

Small set of shell scripts to manage MySQL privileges for teaching and lab environments.

The scripts assume:
- Authentication via `~/.my.cnf` (no password on the command line)
- MySQL 8.x
- You have admin rights (e.g., `root` or an admin user).

## Scripts

- `bin/mysql-grant-schema.sh`  
  Grant ALL PRIVILEGES on a schema to a user (host defaults to `%`).

- `bin/mysql-revoke-schema.sh`  
  Revoke ALL PRIVILEGES on a schema for a user (host defaults to `%`).

- `bin/mysql-list-privs.sh`  
  Show all grants for a given MySQL user@host.

## Usage

```bash
./bin/mysql-grant-schema.sh mydb E_student_user
./bin/mysql-revoke-schema.sh mydb E_student_user
./bin/mysql-list-privs.sh E_student_user

## Install on a new machine

```bash
git clone git@github.com:YOURUSER/dotfiles.git
cd dotfiles
./install.sh
```
## This installer:
    Backs up any existing dotfiles
    Installs my optimized configurations
    Links everything cleanly
    Installs executable scripts into ~/bin/
GitHub CLI — push repo
After cloning / creating the repo:

gh repo create YOURUSER/dotfiles --public --source=. --remote=origin --push

## Directory Structure
See embedded tree above.
License

MIT License — feel free to reuse.
