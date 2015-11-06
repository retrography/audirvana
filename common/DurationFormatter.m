/*
 DurationFormatter.m
 This file is part of AudioNirvana.

 AudioNirvana is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 AudioNirvana is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with Audirvana.  If not, see <http://www.gnu.org/licenses/>.

 Original code written by Damien Plisson 03/2011
 */

#import "DurationFormatter.h"


@implementation DurationFormatter

- (NSString *)stringForObjectValue:(id)anObject {

    if (![anObject isKindOfClass:[NSNumber class]]) {
        return nil;
    }

	SInt64 duration = [anObject longValue];

	if (duration < 0) {
		duration = -duration;
		return [NSString stringWithFormat:@"-%02lli:%02lli",duration/60,duration%60];
	}
    else return [NSString stringWithFormat:@"%02lli:%02lli",duration/60,duration%60];
}

- (NSAttributedString *)attributedStringForObjectValue:(id)anObject withDefaultAttributes:(NSDictionary *)attributes
{
	NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:[self stringForObjectValue:anObject]
																  attributes:attributes];
	return [attrStr autorelease];
}

- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string errorDescription:(NSString  **)error
{
	//No editing facility provided
	return NO;
}
@end