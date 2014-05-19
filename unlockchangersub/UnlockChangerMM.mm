#import <Preferences/Preferences.h>

@interface UnlockChangerListController: PSListController {
}
@end

@implementation UnlockChangerListController

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

// vim:ft=objc
