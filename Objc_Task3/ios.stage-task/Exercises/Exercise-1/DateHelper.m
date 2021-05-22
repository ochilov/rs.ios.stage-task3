#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
	NSDateFormatter *dateFormatter = [NSDateFormatter new];
	if (0 < monthNumber && monthNumber <= dateFormatter.monthSymbols.count) {
		return dateFormatter.monthSymbols[monthNumber-1];
	}
    return nil;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
	NSDateFormatter *dateFormatter = [NSDateFormatter new];
	dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
	NSDate *dateVal = [dateFormatter dateFromString:date];
	NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSInteger day = [gregorianCalendar component:NSCalendarUnitDay fromDate:dateVal];
    return day;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {	
	NSDateFormatter *dateFormatter = [NSDateFormatter new];
	dateFormatter.dateFormat = @"E";
	dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
	return [dateFormatter stringFromDate:date];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
	NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

	NSDateComponents *inputDateComponents = [gregorianCalendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitWeekOfMonth fromDate:date];
	
	NSDateComponents *currentDateComponents = [gregorianCalendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitWeekOfMonth fromDate:[NSDate date]];
	
	if (inputDateComponents .year == currentDateComponents .year &&
		inputDateComponents.month == currentDateComponents.month &&
		inputDateComponents.weekOfMonth == currentDateComponents.weekOfMonth
	) {
		return YES;
	}
	
    return NO;
}

@end
