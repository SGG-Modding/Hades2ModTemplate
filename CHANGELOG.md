# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.6.2] - 2024-06-07

### Changed

- Template uses ModUtil `4.0.0` and `once_loaded.game` instead of `on_ready_final`.
- Use annotated tags instead of lightweight tags in release workflow.

## [0.6.1] - 2024-05-23

### Changed

- Template imports the game globals as a fallback.

### Fixed

- Fixed typo when defining `_PLUGIN` in the template.
- Fixed a minor issue with the release workflow.

## [0.6.0] - 2024-05-20

### Added

- Added dedicated `ready` and `reload` files so `main.lua` can be ignored for simple mods.
- Added a stub `defs.lua` as a reminder to document the plugin if relevant.

### Changed

- Default template is more up-to-date.

## [0.5.1] - 2024-05-15

### Fixed

- Use `plugins` as target for `src` files to prevent flattening the Thunderstore package on decompression.

## [0.5.0] - 2024-05-15

### Changed

- Default template is now a valid example plugin

## [0.4.0] - 2024-05-15

### Changed

- Swap tagging / publishing steps in release workflow so that no tagging happens until we're sure it's published.

### Fixed

- Fix release workflow failing to publish due to not properly picking up the built package name.

## [0.3.0] - 2024-05-15

### Added

- Add warning in release workflow if tag format is invalid, rather than fail silently.

### Fixed

- Require tag to be set when trying to run the release workflow.

## [0.2.0] - 2024-05-14

### Changed

- Streamline release workflow to make it fast-fail before tagging / releasing in case of build failure.

## [0.1.0] - 2024-04-24

### Added

- First version of the template!

[unreleased]: https://github.com/SGG-Modding/Hades2ModTemplate/compare/0.6.2...HEAD
[0.6.2]: https://github.com/SGG-Modding/Hades2ModTemplate/compare/0.6.1...0.6.2
[0.6.1]: https://github.com/SGG-Modding/Hades2ModTemplate/compare/0.6.0...0.6.1
[0.6.0]: https://github.com/SGG-Modding/Hades2ModTemplate/compare/0.5.1...0.6.0
[0.5.1]: https://github.com/SGG-Modding/Hades2ModTemplate/compare/0.5.0...0.5.1
[0.5.0]: https://github.com/SGG-Modding/Hades2ModTemplate/compare/0.4.0...0.5.0
[0.4.0]: https://github.com/SGG-Modding/Hades2ModTemplate/compare/0.3.0...0.4.0
[0.3.0]: https://github.com/SGG-Modding/Hades2ModTemplate/compare/0.2.0...0.3.0
[0.2.0]: https://github.com/SGG-Modding/Hades2ModTemplate/compare/0.1.0...0.2.0
[0.1.0]: https://github.com/SGG-Modding/Hades2ModTemplate/compare/0fda8dfd5e2fac61eb377dd21f1f8b5874f15037...0.1.0
