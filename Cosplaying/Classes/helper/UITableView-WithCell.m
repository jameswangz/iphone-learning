//
//  UITableView-WithCell.m
//  ATP Calendar
//
//  Created by James Wang on 4/16/10.
//  Copyright 2010 DerbySoft. All rights reserved.
//

#import "UITableView-WithCell.h"


@implementation UITableView (WithCell)

- (UITableViewCell *)dequeueOrInit:(NSString *)identifier withStyle:(UITableViewCellStyle)cellStyle {
	UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:identifier];
	if (cell != nil) {
		return cell;
	}
	return [[[UITableViewCell alloc] initWithStyle:cellStyle reuseIdentifier:identifier] autorelease];
}

- (UITableViewCell *)dequeueOrInit:(NSString *)identifier {
	return [self dequeueOrInit:identifier withStyle:UITableViewCellStyleDefault];
}
			
@end
