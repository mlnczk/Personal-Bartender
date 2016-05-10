//
//  DrinksTableViewCell.h
//  PersonalBartender
//
//  Created by Marcin Mielniczek on 4/30/16.
//  Copyright © 2016 Marcin Mielniczek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Drinks.h"

@interface DrinksTableViewCell : UITableViewCell

- (void)customizeWithTitle:(Drinks *)drinks;

@end
