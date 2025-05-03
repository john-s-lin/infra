# Cloud Storage

Cloud storage is offered through `rclone`. If this is the first time, you have to configure the login credentials manually for both OneDrive and Google Drive.

You can do this as follows:

```bash
rclone config
```

Follow the instructions for both OneDrive and Google Drive, login through the web interfaces and you should be good to go! Configuration tokens will be stored locally in `${XDG_CONFIG_HOME}/rclone/rclone.conf`.
