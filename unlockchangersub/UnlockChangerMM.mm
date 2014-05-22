#import <Preferences/Preferences.h>
#import <AppList.h>
#import <objc/runtime.h>
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>

@interface UnlockChangerListController: PSListController {
}
@end

@implementation UnlockChangerListController

//    allowsContentModifications  property
//   CGColor  property
//   immutable  property
//   title  property
//   type  property
//   allowedEntityTypes  property
//   source  property
//   subscribed  property
//   supportedEventAvailabilities  property
//   calendarIdentifier  property

- (NSArray *)valuesSource:(id)target {

	EKEventStore *store = [[EKEventStore alloc] init];
NSArray *eventCalendars = [store calendars];
//NSArray *eventCalendars = [store calendarsForEntityType:EKEntityTypeEvent];
//NSString * mytest = [MyCalendars indexOfObject:2];
NSMutableArray *idArray = [[NSMutableArray alloc] init];


for(EKCalendar * myStr in eventCalendars) {
     //NSLog(myStr.title);
     //NSLog(@"%@",myStr.title);
     [idArray addObject:myStr.calendarIdentifier];
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

NSString *account = @"";
NSString *s = @"";
EKSource *myAccount = nil;

for(EKCalendar * myStr in eventCalendars) {
     //NSLog(myStr.title);
     //NSLog(@"%@",myStr.title);
     //myAccount = [EKSource myStr.source];
     //account = [NSString myAccount.title];
     myAccount = [myStr source];
     account = [myAccount title];
     //account = [account stringByAppendingString:myStr.title];
     s = @"";
     s = [s stringByAppendingFormat:@"%@ - %@",account,myStr.title];
     [idArray addObject:s];
     //[LogFile WriteLogWithString:@"%@",myStr.title];
     //[LogFile WriteLogWithString:myStr.title];
}
  //return [NSArray arrayWithObjects:@"80", @"100", @"120", @"160", @"200", nil];
  //NSSortDescriptor *sd = [[NSSortDescriptor alloc] initWithKey:nil ascending:YES];
  //NSMutableArray *sidArray = [idArray sortedArrayUsingDescriptors:@[sd]];
  NSArray *cidArray = [idArray copy];
  NSArray *sidArray =
    [cidArray sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
  return sidArray;
  //return [NSArray arrayWithObjects:@"80(default)", @"100", @"120", @"160", @"200(insensitive)", nil];
}

- (NSArray *)ActProfiles:(id)target {
    NSString *settingsPathAct = @"/private/var/mobile/Library/Caches/libactivator.plist";
    NSMutableDictionary *prefsAct = [[NSMutableDictionary alloc] initWithContentsOfFile:settingsPathAct];
    NSString *textAct = @"Default";
    NSArray *myActProfs = [prefsAct objectForKey:@"LAProfiles"];
    NSMutableArray *idArray = [[NSMutableArray alloc] init];
     [idArray addObject:textAct];
     for(NSString *Prof in myActProfs) {
     [idArray addObject:Prof];
	}
  return idArray;
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

@interface CustomCell : PSTableCell <PreferencesTableCustomView> {
    UILabel *_label;
}
@end
 
@implementation CustomCell
- (id)initWithSpecifier:(PSSpecifier *)specifier
{
        self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell" specifier:specifier];
        if (self) {
                CGRect frame = [self frame];
 
                _label = [[UILabel alloc] initWithFrame:frame];
                [_label setLineBreakMode:UILineBreakModeWordWrap];
                [_label setNumberOfLines:0];
                [_label setText:@"You can use attributed text to make this prettier."];
                [_label setBackgroundColor:[UIColor clearColor]];
                [_label setShadowColor:[UIColor whiteColor]];
                [_label setShadowOffset:CGSizeMake(0,1)];
                [_label setTextAlignment:UITextAlignmentCenter];
 
                [self addSubview:_label];
                [_label release];
        }
        return self;
}
 
- (float)preferredHeightForWidth:(float)arg1
{
    // Return a custom cell height.
    return 60.f;
}
@end

//Then, set the cellClass, headerCellClass or footerCellClass in your specifier. For example:
//
//...
//{ 
//  cell = PSGroupCell;
//  footerCellClass = CustomCell;
//},
//...
//
//A cell doesn't have to be specified for custom cells.
//Making an editable PSListController
//
//Making a PSListController editable, so you can preform "swipe-to-delete" on the rows is easy at runtime.
//
//You just have to use a subclass of PSEditableListController (which is a subclass of PSListController) instead of a subclass of PSListController for your List Controller. For example:

@interface MyListController : PSEditableListController {}
@end
@implementation MyListController
- (id)specifiers
{
    if (!_specifiers){
       //add a sample specifier to the list
        PSSpecifier* testSpecifier = [PSSpecifier preferenceSpecifierNamed:@"test"
                                                               target:self
                                                                  set:nil
                                                                  get:nil
                                                               detail:nil
                                                                 cell:PSTitleValueCell
                                                                 edit:0];
        _specifiers = [NSArray arrayWithObjects:testSpecifier, nil];
 
    }
    return _specifiers;
}
@end

//Please note, you will only be able to delete a specifier, if it's class is either PSLinkListCell, PSListItemCell or PSTitleValueCell
//To perform a custom action when the specifier gets deleted, you have to implent a method in your PSEditableListController subclass like this one

-(void)removedSpecifier:(PSSpecifier*)specifier{
    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Removing specifier: "
                                                   message:[specifier name]
                                                  delegate:self
                                         cancelButtonTitle:@"OK"
                                         otherButtonTitles:nil];
    [alert show];
}

//and set the deletionAction Key of the specifier:
//extern NSString* PSDeletionActionKey;
 
/*construct the PSSpecifier* testSpecifier here
....
*/
 
[testSpecifier setProperty:NSStringFromSelector(@selector(removedSpecifier:)) forKey:PSDeletionActionKey];



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
