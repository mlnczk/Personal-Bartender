//
//  DrinksViewController.h
//  PersonalBartender
//
//  Created by Marcin Mielniczek on 4/28/16.
//  Copyright © 2016 Marcin Mielniczek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Alcohols.h"

@interface DrinksViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)Alcohols *selectedTitle;

@end
