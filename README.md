# Hades II mod template

This mod template can be used as basis for creating your own Hades II mods and
publishing them on [Thunderstore](https://thunderstore.io/).

## Prerequisites

- Basic git knowledge.
- Basic Markdown knowledge.
- A GitHub account.
- A Thunderstore team / namespace.
  - If you need to create one, login on Thunderstore using your GitHub account.

## Setup

- Create a new GitHub repository to host your mod.
- Download [**hades2-mod-template.zip**](https://github.com/SGG-Modding/Hades2ModTemplate/releases/latest/download/hades2-mod-template.zip) and extract it.
- Edit the following as needed:
  - `README.md`: everything about your mod (name, features, etc.).
  - `LICENSE`: the [MIT license](https://choosealicense.com/licenses/mit/) is shipped by default.
    - If you are OK with that, just edit `[year]` and `[fullname]`.
    - If not, make sure to change the license now.
  - `thunderstore.toml`: your Thunderstore mod package definition. Edit the following as needed:
    - `namespace`: your Thunderstore team / namespace.
    - `name`: your mod name.
    - `description`: short description of your mod. It will be used by the Thunderstore search, so make sure to include words that people are likely to search for when looking for your mod.
    - `websiteUrl`: your GitHub repository (or website, or Discord server, if you prefer).
    - `[package.dependencies]`: your mod dependencies.
    - `[publish.categories]`: the categories you want your mod to appear under. [See the API](https://thunderstore.io/api/experimental/community/hades-ii/category/) for list of available categories.
  - `icon.png`: your Thunderstore mod icon.
- Push everything to your GitHub repository.
- From Thunderstore:
  - Go to [**Teams settings**](https://thunderstore.io/settings/teams/) and select your team.
  - Create a new **Service Account** for your mod (we recommend using the same name as the mod name).
  - You will get an **API token** associated to the new **Service Account**.
- From your GitHub repository:
  - Go to **Settings** > **Secrets and variables** > **Actions**.
  - Create a **new repository secret** named `TCLI_AUTH_TOKEN` and copy/paste the **API token** as its value.

That's it, you are now ready to [**develop**](#develop).

## Develop

- Make sure to continuously update the `README.md` and `CHANGELOG.md` files as you add, change, or remove features.
  - This ensures you won't forget to document them.
  - For good practices on changelog maintenance, please see [Keep a Changelog](https://keepachangelog.com/).
- Any git workflow of your choice can be used, however it is recommended that you plan on making releases from your repository's default branch (`main` by default).

Hack away, and [**release**](#release) when ready.

## Release

- From your GitHub repository, go to **Actions** and select the **Publish** workflow on the left.
- Select the **Run workflow** dropdown on the right.
  - By default, your repository's default branch (`main` by default) is selected. This is why we recommended for planning on making releases from it. If you want to release from another branch, select it.
- Input the version to release, e.g. `1.2.0`.
  - For good practices on versioning, please see [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
- Click the **Run workflow** button.
- A new workflow run will be triggered, and will take care of:
  - Rotating `CHANGELOG.md`.
  - Tagging the git repository.
  - Making a new GitHub release.
  - Building the Thunderstore mod package.
  - Publishing the package on Thunderstore.
  - Uploading the package to the GitHub release as an asset.
- After a new release has been published, it's a good idea to pull the changes locally so as to ensure your local `CHANGELOG.md` is up to date.

### Dry-run

- If you leave the version input blank, the workflow will do a dry-run.
- In this mode, a Thunderstore mod package is immediately built off the current state of the chosen branch, and uploaded to the workflow run as an artifact.
  - The changelog is not rotated, no tagging happens, no GitHub release is made, no publishing to the Thunderstore.
- This can be used to inspect the Thunderstore package without publishing (e.g. if you are making changes to `thunderstore.toml`).
