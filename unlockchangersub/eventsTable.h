#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>

@interface eventsTable : UIViewController <UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate,UIPopoverControllerDelegate,UINavigationControllerDelegate> {

IBOutlet UITableView *Table;
EKEventStore *eventStore;
EKEvent *event;

EKEventViewController *detailViewController;

EKCalendar *defaultCalendar;
NSMutableArray *eventsList;
}
-(IBAction) done;
- (NSArray *)fetchEventsForToday;
@property (nonatomic, retain) 
IBOutlet UITableView *Table;

@property (nonatomic, retain) EKEventStore *eventStore;
@property (nonatomic, retain) EKCalendar *defaultCalendar;
@property (nonatomic, retain) NSMutableArray *eventsList;
@property (nonatomic, retain) EKEventViewController *detailViewController;

@end
