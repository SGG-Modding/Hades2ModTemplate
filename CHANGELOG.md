# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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

[unreleased]: https://github.com/SGG-Modding/Hades2ModTemplate/compare/0.4.0...HEAD
[0.4.0]: https://github.com/SGG-Modding/Hades2ModTemplate/compare/0.3.0...0.4.0
[0.3.0]: https://github.com/SGG-Modding/Hades2ModTemplate/compare/0.2.0...0.3.0
[0.2.0]: https://github.com/SGG-Modding/Hades2ModTemplate/compare/0.1.0...0.2.0
[0.1.0]: https://github.com/SGG-Modding/Hades2ModTemplate/compare/0fda8dfd5e2fac61eb377dd21f1f8b5874f15037...0.1.0
