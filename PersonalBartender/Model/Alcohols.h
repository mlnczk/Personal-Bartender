//
//  Alcohols.h
//  PersonalBartender
//
//  Created by Rafal Kampa on 10.05.2016.
//  Copyright © 2016 Marcin Mielniczek. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "Drinks.h"

@interface Alcohols : JSONModel

@property (nonatomic, strong)NSString *alcoholName;
@property (nonatomic, strong)NSArray<Drinks>* drinks;



@end
