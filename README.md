
# Bash handlers

## Overview

`handlers.sh` is a Bash script that provides a set of utility functions for handling various tasks, such as logging, error handling, and system notifications.

## Functions

| Function | Description | Arguments |
| --- | --- | --- |
| [log](https://codeberg.org/f1uff3h/bash/src/branch/main/handlers.sh#L1) | Print log messages to the console | `log_level` (info, success, warning, or error), `log_message` |
| [notify](https://codeberg.org/f1uff3h/bash/src/branch/main/handlers.sh#L31) | Send system notifications | `notification_type` (system), `notification_message` |
| [handle_log](https://codeberg.org/f1uff3h/bash/src/branch/main/handlers.sh#L43) | Set up logging for the script | `log_file_path` (optional) |
| [handle_error](https://codeberg.org/f1uff3h/bash/src/branch/main/handlers.sh#L49) | Handle errors that occur during script execution | `line_number` (the line number where the error occurred) |
| [handle_root](https://codeberg.org/f1uff3h/bash/src/branch/main/handlers.sh#L54) | Check if the script is running as root | None |
| [handle_environment](https://codeberg.org/f1uff3h/bash/src/branch/main/handlers.sh#L61) | Check for required environment variables | `environment_variable_name` (one or more environment variable names) |
| [handle_debian](https://codeberg.org/f1uff3h/bash/src/branch/main/handlers.sh#L70) | Check if the system is based on Debian | None |

## Example usage

To use the functions in `handlers.sh`, simply source the script in your Bash script or interactive shell:

```bash
source <(curl https://codeberg.org/f1uff3h/bash/raw/branch/main/handlers.sh)
```
