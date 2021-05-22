#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
	NSMutableArray *commands = [NSMutableArray new];
	for (int i = 0, count = (int)ratingArray.count; i < count-2; ++i) {
		NSInteger iVal = ratingArray[i].integerValue;
		for (int j = i+1; j < count-1; ++j) {
			NSInteger jVal = ratingArray[j].integerValue;
			for (int k = j+1; k < count; ++k) {
				NSInteger kVal = ratingArray[k].integerValue;
				if ((iVal < jVal && jVal < kVal) // ascending ordered
				 || (iVal > jVal && jVal > kVal) // descending ordered
				) {
					[commands addObject:@[ratingArray[i], ratingArray[j], ratingArray[k]]];
				}
			}
		}
	}
    return commands.count;
}

@end
