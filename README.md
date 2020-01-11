# Server_Auto_Backup
Allows for rclone to run in the background and backup files while no current Plex streams are active.

## Steps
1. Clone or download repository to your desired computer/server
2. Open **CurrentPlexStreams.sh** and modify the following items with your respective values
	- **<PLEX_TOKEN>** With your Respective Plex Token -- [Here's a guide from Plex to getting your Plex Token](https://support.plex.tv/articles/204059436-finding-an-authentication-token-x-plex-token/)
  	- **[http|https]** Update with either HTTP or HTTPS
  	- **<PLEX_SERVER_IP>** Update with your Plex Server IP
3. Open **PlexBackup.sh** and modify the following items with your respective values
	- **\<TO>** With the location you are going to sync
	- **\<FROM>** With the location you desire to sync the **<TO>** location with
	- Feel free to add/modify/remove item from the rclone command
4. Setup crontab item to have the backup scheduled
	- Add entry to crontab -- `sudo crontab -e`
	- Add the following line to the end of the file (best to run script at a lower interval to handle when Plex streams change) --If you would like help setting up your scheduled task [Crontab Guru](https://crontab.guru/) is a great interactive tool
		- `* * * * * <PATH_TO_REPO>/PlexBackup.sh` -- Will run script every minute
		- Replace the following with the respective path oft he downloaded/cloned repository **<PATH_TO_REPO>**
