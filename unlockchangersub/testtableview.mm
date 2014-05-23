//3. Fill in UITableView with values from DataGenerator

//Next we’re going to populate the currently empty table with data we get from our data generator. Open RootViewController.h and add these two instance variables to the class: 

#import "DataGenerator.h"
 
@interface RootViewController : PSViewController <UITableViewDelegate> {
    NSArray *content;
    NSArray *indices;
}
@end

@implementation RootViewController
//content will hold our array of dictionaries while indices will hold all initial letters for each word in the list. Let's fill those up. Open RootViewController.m implementation file and override the method viewDidLoad with the following:

- (void)viewDidLoad {
    [super viewDidLoad];
    content = [DataGenerator wordsFromLetters];
    indices = [[content valueForKey:@"headerTitle"] retain];
}

//You can see that we're using [DataGenerator wordsFromLetters] to simply fill in the content variable. The second line of that method returns all keys from the dictionaries in content as an array. So indices now holds all letters of the alphabet.

//We next override the two methods that tell our UITableView how many sections it has and how many rows there are in each section.


// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [content count];
}
 
// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[content objectAtIndex:section] objectForKey:@"rowValues"] count] ;
}

//The number of sections is equal to the number of letters in our list and the number of rows of each section is equal to the count of each array under its corresponding letter.

//Finally, we implement cellForRowAtIndexPath so that it displays words from our list in the table. We handle headers for sections in titleForHeaderInSection. This method queries our content at a particular section and demands a headerTitle to be returned as header of that section


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    static NSString *CellIdentifier = @"Cell";
 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:CellIdentifier] autorelease];
    }
    cell.textLabel.text = [[[content objectAtIndex:indexPath.section] objectForKey:@"rowValues"]
                           objectAtIndex:indexPath.row];
 
    return cell;
}

//4. Add index to the table
// There is nothing new in what we've done so far. We simply filled in a UITableView with some data. 
//We're now ready to add our index to it. For that, we'll need to implement two methods: 
//sectionIndexTitlesForTableView and sectionForSectionIndexTitle. 

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return [content valueForKey:@"headerTitle"];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return [indices indexOfObject:title];
}

//One more thing we need to do before we run our app is to add titles to each section header in UITableView.
- (NSString *)tableView:(UITableView *)aTableView titleForHeaderInSection:(NSInteger)section {
	return [[content objectAtIndex:section] objectForKey:@"headerTitle"];
 
}

@end
