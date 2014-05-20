#import "MyClass.h"

@implementation LogFile


+ (NSString*)CurrentSystemTime {
    return [[NSDate date] description];
}

+(NSString*)getDocumentsPath
{
    NSString *path  = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return path;
}

+ (NSString*)getLogFilePath
{
    NSString *loggingFilePath = nil;

    loggingFilePath = [[self getDocumentsPath] stringByAppendingPathComponent:@"/MYLogFile.txt"];
    return loggingFilePath;
}


+ (void)WriteLogWithString:(NSString *)log
{

        if(log != nil){

            NSString *locationFilePath = [self getLogFilePath];

           NSString *str = [NSString stringWithFormat:@"%@  %s [Line %d]: %@", [self CurrentSystemTime],__PRETTY_FUNCTION__,__LINE__,log];            
            FILE *fp = fopen([locationFilePath UTF8String], "a");

            fprintf(fp,"%s\n", [str UTF8String]);

            fclose(fp);
        }

}

@end
