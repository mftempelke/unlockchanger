#import <Preferences/Preferences.h>
#import <AppList.h>
#import <objc/runtime.h>
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>

@interface UnlockChangerListController: PSListController {
}
@end

@implementation UnlockChangerListController

- (NSArray *)valuesSource:(id)target {

	EKEventStore *store = [[EKEventStore alloc] init];
NSArray *eventCalendars = [store calendars];
//NSArray *eventCalendars = [store calendarsForEntityType:EKEntityTypeEvent];
//NSString * mytest = [MyCalendars indexOfObject:2];
NSMutableArray *idArray = [[NSMutableArray alloc] init];


for(EKCalendar * myStr in eventCalendars) {
     //NSLog(myStr.title);
     //NSLog(@"%@",myStr.title);
     [idArray addObject:myStr.title];
     //[LogFile WriteLogWithString:@"%@",myStr.title];
     //[LogFile WriteLogWithString:myStr.title];
}
  //return [NSArray arrayWithObjects:@"80", @"100", @"120", @"160", @"200", nil];
  return idArray;
}

- (NSArray *)titlesSource:(id)target {
	EKEventStore *store = [[EKEventStore alloc] init];
NSArray *eventCalendars = [store calendars];
//NSArray *eventCalendars = [store calendarsForEntityType:EKEntityTypeEvent];
//NSString * mytest = [MyCalendars indexOfObject:2];
NSMutableArray *idArray = [[NSMutableArray alloc] init];


for(EKCalendar * myStr in eventCalendars) {
     //NSLog(myStr.title);
     //NSLog(@"%@",myStr.title);
     [idArray addObject:myStr.title];
     //[LogFile WriteLogWithString:@"%@",myStr.title];
     //[LogFile WriteLogWithString:myStr.title];
}
  //return [NSArray arrayWithObjects:@"80", @"100", @"120", @"160", @"200", nil];
  return idArray;
  //return [NSArray arrayWithObjects:@"80(default)", @"100", @"120", @"160", @"200(insensitive)", nil];
}


-(void)TFTwitterButtonTapped
{
    UIApplication *app = [UIApplication sharedApplication];
    NSURL *tweetbot = [NSURL URLWithString:@"tweetbot:///user_profile/mftemp"];
    if ([app canOpenURL:tweetbot])
        [app openURL:tweetbot];
    else {
        NSURL *twitterapp = [NSURL URLWithString:@"twitter:///user?screen_name=mftemp"];
        if ([app canOpenURL:twitterapp])
            [app openURL:twitterapp];
        else {
            NSURL *twitterweb = [NSURL URLWithString:@"http://twitter.com/mftemp"];
            [app openURL:twitterweb];
        }
    }
}

-(void)JGTwitterButtonTapped
{
    UIApplication *app = [UIApplication sharedApplication];
    NSURL *tweetbot = [NSURL URLWithString:@"tweetbot:///user_profile/mftemp"];
    if ([app canOpenURL:tweetbot])
        [app openURL:tweetbot];
    else {
        NSURL *twitterapp = [NSURL URLWithString:@"twitter:///user?screen_name=mftemp"];
        if ([app canOpenURL:twitterapp])
            [app openURL:twitterapp];
        else {
            NSURL *twitterweb = [NSURL URLWithString:@"http://twitter.com/mftemp"];
            [app openURL:twitterweb];
        }
    }
}

-(void)DonateButtonTapped
{
    NSURL *donateURL = [NSURL URLWithString:@"https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=fokkema%2emenno%40gmail%2ecom&lc=US&item_name=Menno%20Fokkema&item_number=Priority%20Lock&no_note=0&currency_code=EUR&bn=PP%2dDonationsBF%3abtn_donate_LG%2egif%3aNonHostedGuest"];
    [[UIApplication sharedApplication] openURL:donateURL];
}



- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"UnlockChangerMFOK" target:self] retain];
	}
	return _specifiers;
}

@end

@interface ExtraPageListController: UnlockChangerListController {
}
@end

@implementation ExtraPageListController

-(void)AnotherTwitterButtonTapped
{
    UIApplication *app = [UIApplication sharedApplication];
    NSURL *tweetbot = [NSURL URLWithString:@"tweetbot:///user_profile/mftemp"];
    if ([app canOpenURL:tweetbot])
        [app openURL:tweetbot];
    else {
        NSURL *twitterapp = [NSURL URLWithString:@"twitter:///user?screen_name=mftemp"];
        if ([app canOpenURL:twitterapp])
            [app openURL:twitterapp];
        else {
            NSURL *twitterweb = [NSURL URLWithString:@"http://twitter.com/mftemp"];
            [app openURL:twitterweb];
        }
    }
}

- (id)specifiers {
if(_specifiers == nil) {

_specifiers = [[self loadSpecifiersFromPlistName:@"ExtraPage" target:self] retain];
//NSArray  * myArray2 = [NSArray arrayWithObjects:@"foo",@"bar",@"baz",nil];
//_specifiers = [[self addSpecifiersFromArray:myArray2 target:self] retain];
}
return _specifiers;
}

@end

// too many errors ;(
//@interface ExtraPageListController: UnlockChangerListController {
@interface FLPrefsController : PSViewController <UITableViewDelegate>
{
    UITableView *_tableView;
    
    NSString *_prefsKey;
    NSMutableDictionary *_prefsDict;
    ALApplicationTableDataSource *_dataSource;
}
- (id)initForContentSize:(CGSize)size;
- (UIView *)view;
- (CGSize)contentSize;
- (id)navigationTitle;
@end

@interface FLAppsDataSource : ALApplicationTableDataSource <ALValueCellDelegate>
{
    FLPrefsController *_controller;
}
- (id)initWithController:(FLPrefsController *)controller;
@end

#define kPrefsPath @"/var/mobile/Library/Preferences/com.jw97.fliplaunch.plist"

@implementation FLPrefsController

- (id)initForContentSize:(CGSize)size
{
    if ([[PSViewController class] instancesRespondToSelector:@selector(initForContentSize:)])
self = [super initForContentSize:size];
else
self = [super init];

    if (self)
    {
CGRect frame;
frame.origin = (CGPoint){0, 0};
frame.size = size;
        
_tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];

        BOOL isOS7 = (objc_getClass("UIAttachmentBehavior") != nil);
        if (isOS7) _tableView.contentInset = UIEdgeInsetsMake(64.0f, 0.0f, 0.0f, 0.0f);
        
        //AppList integration
        _prefsKey = @"launchIDs";
        _prefsDict = [[NSMutableDictionary alloc] initWithContentsOfFile:kPrefsPath] ?: [[NSMutableDictionary alloc] init];

        _dataSource = [[FLAppsDataSource alloc] initWithController:self];
        NSNumber *iconSize = [NSNumber numberWithUnsignedInteger:ALApplicationIconSizeSmall];
        NSArray *sectionDescriptors = [NSArray arrayWithObjects: [NSDictionary dictionaryWithObjectsAndKeys:@"Available Apps", ALSectionDescriptorTitleKey, @"ALCheckCell", ALSectionDescriptorCellClassNameKey, iconSize, ALSectionDescriptorIconSizeKey, (id)kCFBooleanTrue, ALSectionDescriptorSuppressHiddenAppsKey,
                                                                  nil], nil];
        _dataSource.sectionDescriptors = sectionDescriptors;
        //Table view stuffs
[_tableView setDataSource:_dataSource];
[_tableView setDelegate:self];
[_tableView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin];
    }
return self;
}

- (void)dealloc
{
    [_prefsDict release];

[_tableView setDelegate:nil];
[_tableView setDataSource:nil];
[_tableView release];
[super dealloc];
}

- (UIView *)view
{
return _tableView;
}

- (UITableView *)table
{
    return _tableView;
}

- (CGSize)contentSize
{
return [_tableView frame].size;
}

- (id)navigationTitle
{
    return @"Available Apps";
}

- (NSString *)title
{
    return @"Available Apps";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    
id cell = [_tableView cellForRowAtIndexPath:indexPath];
    [cell didSelect];
}

- (void)cellAtIndexPath:(NSIndexPath *)indexPath didChangeToValue:(id)newValue
{
    NSString *identifier = [_dataSource displayIdentifierForIndexPath:indexPath];
    NSMutableArray *filteredApps = [_prefsDict objectForKey:_prefsKey] ?: [NSMutableArray array];
    
    if ([newValue boolValue]) [filteredApps addObject:identifier];
    else if(![newValue boolValue]) [filteredApps removeObject:identifier];
    [_prefsDict setObject:filteredApps forKey:_prefsKey];
    [_prefsDict writeToFile:kPrefsPath atomically:YES];
    CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), CFSTR("com.jw97.fliplaunch.settingschanged"), NULL, NULL, YES);
}

- (id)valueForCellAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = [_dataSource displayIdentifierForIndexPath:indexPath];
    NSArray *array = [_prefsDict objectForKey:_prefsKey] ?: [NSMutableArray array];

    return [NSNumber numberWithBool:[array containsObject:identifier]];
}

@end

@implementation FLAppsDataSource

- (id)initWithController:(FLPrefsController *)controller
{
if ((self = [super init])) {
_controller = controller;
}
return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id cell = [super tableView:tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:0]];
    if ([cell isKindOfClass:[ALValueCell class]])
    {
        [cell setDelegate:self];
        [cell loadValue:[_controller valueForCellAtIndexPath:indexPath]];
    }
    return cell;
}

- (void)valueCell:(ALValueCell *)valueCell didChangeToValue:(id)newValue
{
[_controller cellAtIndexPath:[self.tableView indexPathForCell:valueCell] didChangeToValue:newValue];
}

@end

// vim:ft=objc
