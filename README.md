# ORCA BarTender label printing SOP

Standard operating procedure for printing ORCA storage and core labels in BarTender from the ORCA sample database (PostgreSQL, via ODBC).

- **Read online:** <https://orcacoreotago.github.io/bartender-label-sop/> (PDF link in the top bar)
- Listed on the ORCA SOPs hub: <https://orcacoreotago.github.io/>

## Editing

1. Edit `index.qmd`. Names and server details live in `_variables.yml`; change them there and they update everywhere.
2. Preview with `quarto preview`.
3. Commit and push. GitHub renders the web page and PDF and publishes them (see the **Actions** tab). Don't commit `_site/`.

First-time setup: **Settings → Pages → Build and deployment → Source: GitHub Actions**.

## Security

The repository is public-facing. **Never** commit the database password, connection `.xml` files, or `.btw` label files.
