tips : 
/private/var/stash/Activator.v5Jd1N/Listeners/nl.mfok.fakebattery
zo simpel is het helaas niet...

/private/var/mobile/Library/Preferences
libactivator.exported.plist

	<key>LAProfileCurrent</key>
	<string>Default</string>
	<key>LAProfiles</key>
	<array>
		<string>test</string>
	</array>
	
live = ./private/var/mobile/Library/Caches/libactivator.plist

	<key>LAProfileCurrent</key>
	<string>MobileLibraryCache</string>
	<key>LAProfiles</key>
	<array>
		<string>test</string>
		<string>MobileLibraryCache</string>
	</array>

dit moet uit te lezen zijn; key LaProfileCurrent + all from LAProfiles

activeren van profile : 

	<key>LAEventListener/MobileLibraryCache(springboard)-libactivator.motion.shake</key>
	<string>libactivator.profile.Default</string>
	
activator send libactivator.profile.Default

subscribe to calendar changes :

[[NSNotificationCenter defaultCenter] addObserver:self

                                         selector:@selector(storeChanged:)

                                             name:EKEventStoreChangedNotification

                                           object:eventStore];
                                           
  
  uit https://developer.apple.com/library/ios/documentation/datamanagement/conceptual/eventkitprogguide/ObservingChanges/ObservingChanges.html#//apple_ref/doc/uid/TP40009765-CH4-SW1


unix tail:

tail -f /private/var/log/syslog

todo:
May 23 17:31:06 Figuurzaagseltje SpringBoard[4214]: Attempt to schedule a notification from PID 4214 which is not an application
May 23 17:31:06: --- last message repeated 3 times ---

May 23 17:31:06 Figuurzaagseltje backupd[4233]: MS:Warning: nil class argument for selector setCustomSlideToUnlockText:
May 23 17:31:06 Figuurzaagseltje backupd[4233]: MS:Warning: nil class argument for selector launch
