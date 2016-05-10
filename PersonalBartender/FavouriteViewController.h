//
//  FavouriteViewController.h
//  PersonalBartender
//
//  Created by Marcin Mielniczek on 4/29/16.
//  Copyright © 2016 Marcin Mielniczek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailsViewController.h"
#import "Alcohols.h"

@interface FavouriteViewController : UIViewController

- (void)showFavourites:(Alcohols *)alcohols;

@end
