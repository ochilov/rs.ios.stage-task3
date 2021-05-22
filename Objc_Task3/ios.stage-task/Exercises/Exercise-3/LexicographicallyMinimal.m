#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
	NSMutableString *result = [[NSMutableString alloc] initWithCapacity:string1.length + string2.length];
	NSUInteger i = 0;
	NSUInteger j = 0;
	BOOL endOfString1, endOfString2;
	do {
		endOfString1 = i >= string1.length;
		endOfString2 = j >= string2.length;
		if (!endOfString1 && !endOfString2) {
			if ([string1 characterAtIndex:i] <= [string2 characterAtIndex:j]) {
				[result appendString:[string1 substringWithRange:NSMakeRange(i, 1)]];
				i++;
			} else {
				[result appendString:[string2 substringWithRange:NSMakeRange(j, 1)]];
				j++;
			}
		} else if (!endOfString1) {
			[result appendString:[string1 substringFromIndex:i]];
			break;
		} else if (!endOfString2) {
			[result appendString:[string2 substringFromIndex:j]];
			break;
		}
	} while (!endOfString1 || !endOfString2);
	
    return [result copy];
}

@end
