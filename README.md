# Lid Monitor

**Lid Monitor** is a lightweight tool designed to monitor your laptop's lid status (open or closed) and execute predefined commands based on the lid's state. It's particularly useful for automating actions like suspending the system upon lid closure.

## Features

- **Real-Time Monitoring:** Continuously checks the lid's status.
- **Customizable Actions:** Execute user-defined commands when the lid opens or closes.
- **User-Friendly Configuration:** Easily set up default and user-specific configurations.

## Installation

### Prerequisites

Ensure you have the following dependencies installed:

- `jq`: A lightweight and flexible command-line JSON processor.

  On Arch Linux, install it using:

  ```bash
  sudo pacman -S jq
  ```

### Steps

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/mahdiware/lid-monitor.git
   ```

2. **Navigate to the Project Directory:**

   ```bash
   cd lid-monitor
   ```

3. **Build and Install:**

   ```bash
   makepkg -si
   ```

## Configuration

### Default Configuration

The system-wide default configuration is located at `/etc/lid-monitor/config.json`. You can modify this file to set default commands for lid events.

```json
{
    "lid_open_command": "echo Lid is open",
    "lid_close_command": "systemctl suspend"
}
```

### User-Specific Configuration

Users can override the default settings by creating a user-specific configuration file at `~/.config/lid-monitor/config.json`. This allows for personalized actions without affecting the system-wide settings.

```json
{
    "lid_open_command": "echo Lid is open",
    "lid_close_command": "systemctl suspend"
}
```

## Usage

1. **Run the Monitor:**

   ```bash
   lid-monitor
   ```

2. **Monitor Output:**

   The script will display messages indicating the lid's status and the actions being executed.

## Contributing

Contributions are welcome! To contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Create a new Pull Request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For any questions or suggestions, please open an issue or contact the maintainer at your.mahdiware@gmail.com.