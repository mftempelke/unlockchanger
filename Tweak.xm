//Here, we're telling theos we want to 'hook' the header SBLockScreenView. 'Hooking' basically means we want to access this header and modify the methods inside it.
#import "MyClass.h" 
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>
 

%hook SBLockScreenView

// subscribe to any changes in events
//[[NSNotificationCenter defaultCenter] addObserver:self
//selector:@selector(storeChanged:)
//name:EKEventStoreChangedNotification object:eventStore];

//Now that theos knows we want to hook the header SBLockScreenView, we can directly 'hijack' SBLockScreenView's methods and modify them to run out own code instead of their original code.

//In this example, we are hijacking the method - (void)setCustomSlideToUnlockText and making it run our own code. This method takes an argument, (id)arg1, which we are calling unlockText.
- (void)setCustomSlideToUnlockText:(id)unlockText {
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    //notification.fireDate = [[NSDate date] dateByAddingTimeInterval:60*60*24];
    notification.fireDate = [[NSDate date] dateByAddingTimeInterval:60];
    notification.alertBody = @"24 hours passed since last visit :(";
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
	    NSString *settingsPathGestr = @"/private/var/mobile/Library/Preferences/com.apple.springboard.plist";
	    NSMutableDictionary *prefsGestr = [[NSMutableDictionary alloc] initWithContentsOfFile:settingsPathGestr];
	    NSString *sbtest = [prefsGestr objectForKey:@"voicemail-sound-identifier"];
	    [LogFile WriteLogWithString:sbtest];
	    NSData *gestures = [prefsGestr objectForKey:@"Gestures"];
	    
	NSString *base64StringGestr = [gestures base64EncodedStringWithOptions:0];
	[LogFile WriteLogWithString:base64StringGestr];
	NSData *decodedDataGestr = [[NSData alloc] initWithBase64EncodedString:base64StringGestr options:0];

	//NSString *decodedStringGestr = [[NSString alloc] initWithData:decodedDataGestr encoding:NSUnicodeStringEncoding];
	NSString *decodedStringGestr = [[NSString alloc] initWithData:decodedDataGestr encoding:NSUTF8StringEncoding];
	NSString *prefix = nil;
	if ([decodedStringGestr length] >= 3)
	    { prefix = [decodedStringGestr substringToIndex:3]; }
	else
	    { prefix = @"string te kort"; }
	[LogFile WriteLogWithString:prefix];


	NSString *plainString = @"foo";
	
	NSData *plainData = [plainString dataUsingEncoding:NSUTF8StringEncoding];
	NSString *base64String = [plainData base64EncodedStringWithOptions:0];
	//NSLog(@"%@", base64String); // Zm9v
	[LogFile WriteLogWithString:base64String];
	
	NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:base64String options:0];
	NSString *decodedString = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
	//NSLog(@"%@", decodedString); // foo
	[LogFile WriteLogWithString:decodedString];


    
    
    
    [LogFile WriteLogWithString:@"sachin thakur"];
    	//static EKEventStore *eventStore = nil;
    	//EKEventStore* store = [[EKEventStore alloc]initWithAccessToEntityTypes:EKEntityMaskEvent];
	//NSArray * MyCalendars = [store calendarsForEntityType:EKEntityTypeEvent];
	//EKEventStore *store = [[EKEventStore alloc]
        //               initWithAccessToEntityTypes:EKEntityMaskEvent];
	EKEventStore *store = [[EKEventStore alloc] init];
	NSArray *eventCalendars = [store calendars];
	//NSArray *eventCalendars = [store calendarsForEntityType:EKEntityTypeEvent];
	//NSString * mytest = [MyCalendars indexOfObject:2];
	for(EKCalendar * myStr in eventCalendars) {
    		//NSLog(myStr.title);
    		NSLog(@"%@",myStr.title);
    		//[LogFile WriteLogWithString:@"%@",myStr.title];
    		[LogFile WriteLogWithString:myStr.title];
	}
	
						// Create the predicate's start and end dates.
	CFGregorianDate gregorianStartDate, gregorianEndDate;
	CFGregorianUnits startUnits = {0, 0, -3, 0, 0, 0};
	CFGregorianUnits endUnits = {0, 0, 2, 0, 0, 0};
	CFTimeZoneRef timeZone = CFTimeZoneCopySystem();
	
	gregorianStartDate = CFAbsoluteTimeGetGregorianDate(
	CFAbsoluteTimeAddGregorianUnits(CFAbsoluteTimeGetCurrent(), timeZone,
	startUnits),
	timeZone);
	gregorianStartDate.hour = 0;
	gregorianStartDate.minute = 0;
	gregorianStartDate.second = 0;
	gregorianEndDate = CFAbsoluteTimeGetGregorianDate(
	CFAbsoluteTimeAddGregorianUnits(CFAbsoluteTimeGetCurrent(), timeZone, endUnits),
	timeZone);
	gregorianEndDate.hour = 0;
	gregorianEndDate.minute = 0;
	gregorianEndDate.second = 0;
	NSDate* startDate =
	[NSDate
	dateWithTimeIntervalSinceReferenceDate:CFGregorianDateGetAbsoluteTime(gregorianStartDate,
	timeZone)];
	NSDate* endDate =
	[NSDate
	dateWithTimeIntervalSinceReferenceDate:CFGregorianDateGetAbsoluteTime(gregorianEndDate,
	timeZone)];
	CFRelease(timeZone);
	// Create the predicate.
	NSPredicate *predicate = [store predicateForEventsWithStartDate:startDate
	endDate:endDate calendars:nil]; // eventStore is an instance variable.
	// Fetch all events that match the predicate.
	NSArray *events = [store eventsMatchingPredicate:predicate];
	//[self setEvents:events];
	NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
	[dateFormatter setDateFormat:@"EEE, d MMM yyyy HH:mm:ss z"];

	
		for(EKEvent * xyStr in events) {
    		//NSLog(myStr.title);
    		//NSLog(@"%@",myStr.title);
    		//[LogFile WriteLogWithString:@"%@",myStr.title];
    		[LogFile WriteLogWithString:xyStr.title];
    		NSString *dateString = [dateFormatter stringFromDate:xyStr.startDate];
    		[LogFile WriteLogWithString:dateString];
		}
	
	
	//NSArray  * myArray2 = [NSArray arrayWithObjects:@"foo",@"bar",@"baz",nil];
	//[myArray2 writeToFile:filePath atomically:YES];
    //In this line, we're telling the program where our settings values exist at in the filesystem. We will use this, for example, to see if the user has our tweak enabled or not.
    //In this line, we're telling the program where our settings values exist at in the filesystem. We will use this, for example, to see if the user has our tweak enabled or not.
    NSString *settingsPath = @"/var/mobile/Library/Preferences/nl.mfok.unlockchanger~prefs.plist";
    NSString *settingsPathAct = @"/private/var/mobile/Library/Caches/libactivator.plist";
    
    //Now, we're creating a modifiable dictionary called 'prefs' which contains the settings values from the line above.
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:settingsPath];
    NSMutableDictionary *prefsAct = [[NSMutableDictionary alloc] initWithContentsOfFile:settingsPathAct];
 
    //Make a new string called 'text' which contains the value of the 'text' key from the prefs dictionary in the line above.
    NSString *text = [prefs objectForKey:@"text"];
	NSString *text2 = [prefs objectForKey:@"text2"];
    NSString *textAct = [prefsAct objectForKey:@"LAProfileCurrent"];
    [LogFile WriteLogWithString:textAct];
    NSArray *myActProfs = [prefsAct objectForKey:@"LAProfiles"];
    	for(NSString *Prof in myActProfs) {
    	[LogFile WriteLogWithString:Prof];
	}
    
    
    //Make a boolean which holds the value of the settings key called "enabled", much like the line above.
    //BOOL enabled = [prefs objectForKey:@"enabled"];
    static NSString * const senabled = @"enabled";
	//static NSString * const EnabledKey = @"enabled";
	BOOL enabled = prefs[senabled] ? [prefs[senabled] boolValue] : YES;   
        
    
    //In this line, we're saying:
    //IF the text string is empty, or:
    //IF the text string is nonexistent, or
    //IF the 'enabled' key is equal to FALSE or NO (i.e. if the user turned off the tweak),
    //if([text isEqualToString:@""] || text == nil || ![enabled]) {
    if([text isEqualToString:@""] || text == nil || [text2 isEqualToString:@""] || text2 == nil || !enabled ) {    
    //if([text isEqualToString:@""] || text == nil || !enabled ) {    
        //THEN, return the method without modifying it at all.
        %orig(unlockText);
        
    }
    
    
    //OTHERWISE
    //IF the 'enabled' key is equal to 'true' or 'on',
    //else if ([enabled]) {
	else if (enabled) {
        
        
        //Set the argument unlockText (remember that?) to whatever is in the 'text' string.
        unlockText = text;
        NSString *text3 = @"Welcome Mennootje";

    	//NSLog(@"process Name: %@ Process ID: %d",text3);
    	NSLog(@"%@",text3);
        //Then, return the original method. But remember, the argument now contains our custom information.
        %orig(unlockText);
        
    }

}


//This lets theos know that we're done hooking this header.
%end

// http://ios-blog.co.uk/tutorials/how-to-create-a-mobilesubstrate-tweaks-for-ios/

%hook SBApplicationIcon

-(void)launch

{

NSString *appName = @"[self displayName]";

NSString *message = [NSString stringWithFormat:@"The app %@ has been launched", appName, nil];

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:appName message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];

    [alert show];

    [alert release];

    %orig;

}

%end
