#import "eventsTable.h"

@implementation eventsTable
@synthesize eventsList, eventStore, defaultCalendar, detailViewController,Table;
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Events List";

// Initialize an event store object with the init method. Initilize the array for events.
self.eventStore = [[EKEventStore alloc] init];

self.eventsList = [[NSMutableArray alloc] initWithArray:0];

// Get the default calendar from store.
self.defaultCalendar = [self.eventStore defaultCalendarForNewEvents];

//  Create an Add button 




// Fetch today's event on selected calendar and put them into the eventsList array
[self.eventsList addObjectsFromArray:[self fetchEventsForToday]];

[Table reloadData];

}
-(IBAction) done{
    [self dismissModalViewControllerAnimated:YES];   
}
#pragma mark -
#pragma mark Table view data source

// Fetching events happening in the next 24 hours with a predicate, limiting to the default calendar 
- (NSArray *)fetchEventsForToday {

    NSDate *startDate1 = [NSDate date];

    // endDate is 1 day = 60*60*24 seconds = 86400 seconds from startDate
    NSDate *endDate1 = [NSDate distantFuture];

    // Create the predicate. Pass it the default calendar.
    NSArray *calendarArray = [NSArray arrayWithObject:defaultCalendar];
    //NSPredicate *predicate = [self.eventStore predicateForEventsWithStartDate:startDate endDate:endDate 
//                                               calendars:calendarArray]; 
NSPredicate *predicate = [self.eventStore predicateForEventsWithStartDate:startDate1 endDate:endDate1 calendars:calendarArray];

// Fetch all events that match the predicate.
NSArray *events = [self.eventStore eventsMatchingPredicate:predicate];





events = 
[events sortedArrayUsingSelector:
 @selector(compareStartDateWithEvent:)];

self.eventsList = [NSMutableArray arrayWithArray:events];
[Table reloadData];

 return events;
}




#pragma mark -
#pragma mark Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section   {
return eventsList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView 
     cellForRowAtIndexPath:(NSIndexPath *)indexPath{

UITableViewCell *result = nil;

if ([tableView isEqual:self.Table] == YES){

    static NSString *EventsCellIdentifier = @"Events";

    /* We have the index path so let's get the corresponding
     event from the array of events */
    EKEvent *event1 = [self.eventsList 
                       objectAtIndex:indexPath.row];

    /* Try to get a reusable table cell */
    result = 
    [tableView dequeueReusableCellWithIdentifier:EventsCellIdentifier];

    if (result == nil){
        result = [[[UITableViewCell alloc] 
                   initWithStyle:UITableViewCellStyleSubtitle
                   reuseIdentifier:EventsCellIdentifier] autorelease];
    }

    /* The title text of the cell will be the title of the event */
    result.textLabel.text = event1.title;
    result.textLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    result.detailTextLabel.font = [UIFont systemFontOfSize:12.0f];


    /* Now let's format the date and the time of the event
     and display it as the subtitle of the cell */
    NSCalendar *calendar =  [NSCalendar currentCalendar];
    NSDateComponents *components = 
    [calendar components:
     NSYearCalendarUnit | 
     NSMonthCalendarUnit | 
     NSDayCalendarUnit |
     NSHourCalendarUnit |
     NSMinuteCalendarUnit |
     NSSecondCalendarUnit
                fromDate:event1.startDate];

    NSDateComponents *components1 = 
    [calendar components:
     NSYearCalendarUnit | 
     NSMonthCalendarUnit | 
     NSDayCalendarUnit |
     NSHourCalendarUnit |
     NSMinuteCalendarUnit |
     NSSecondCalendarUnit
                fromDate:event1.endDate];

    if ([components hour] == 0 &&
        [components minute] == 0 &&
        [components second] == 0){


        NSCalendar *calendar = [[[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar] autorelease];
        NSDate *date = [calendar dateFromComponents: components1];
        NSString *string = [NSDateFormatter localizedStringFromDate: date dateStyle: NSDateFormatterShortStyle timeStyle: NSDateFormatterNoStyle];

        NSDate *date1 = [calendar dateFromComponents: components];
        NSString *string1 = [NSDateFormatter localizedStringFromDate: date1 dateStyle: NSDateFormatterShortStyle timeStyle: NSDateFormatterNoStyle];

        result.detailTextLabel.text = 
        [NSString stringWithFormat:@"All Day from %@ - %@",string1,string,
         (long)[components month],
         (long)[components day],
         (long)[components year],
         (long)[components1 month],
         (long)[components1 day],
         (long)[components1 year]];

    } else {
        NSCalendar *calendar = [[[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar] autorelease];
        NSDate *date = [calendar dateFromComponents: components1];
        NSString *string = [NSDateFormatter localizedStringFromDate: date dateStyle: NSDateFormatterShortStyle timeStyle: NSDateFormatterShortStyle];

        NSDate *date1 = [calendar dateFromComponents: components];
        NSString *string1 = [NSDateFormatter localizedStringFromDate: date1 dateStyle: NSDateFormatterShortStyle timeStyle: NSDateFormatterShortStyle];

        result.detailTextLabel.text = 
        [NSString stringWithFormat:@"%@ - %@",string1,string,

         (long)[components month],
         (long)[components day],
         (long)[components year],
         (long)[components hour],
         (long)[components minute],
         (long)[components1 hour],
         (long)[components1 minute]];


    }

}

[event release];
[eventsList release];
[eventStore release];
[result release];
return(result);



}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
cell.selectionStyle = UITableViewCellSelectionStyleNone;


}
- (void)viewDidUnload {
    self.eventsList = nil;
self.view = nil;
    self.Table = nil;

    [super viewDidUnload];
}

- (void)dealloc {
    [super dealloc];
    [Table release];
    [eventStore release];
[eventsList release];
[defaultCalendar release];
[detailViewController release];

}

@end
