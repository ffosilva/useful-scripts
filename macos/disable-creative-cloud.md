It is loaded by default by /Library/LaunchAgents/com.adobe.AdobeCreativeCloud.plist.

If you run

launchctl unload -w /Library/LaunchAgents/com.adobe.AdobeCreativeCloud.plist
that will disable it for your user.

To turn it back on

launchctl load -w /Library/LaunchAgents/com.adobe.AdobeCreativeCloud.plist
