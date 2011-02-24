//
//  UITableView-WithCell.h
//  ATP Calendar
//
//  Created by James Wang on 4/16/10.
//  Copyright 2010 DerbySoft. All rights reserved.
//



@interface UITableView (WithCell)
- (UITableViewCell *)dequeueOrInit:(NSString *)identifier;
- (UITableViewCell *)dequeueOrInit:(NSString *)identifier withStyle:(UITableViewCellStyle)cellStyle;

@end
