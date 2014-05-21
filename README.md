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

