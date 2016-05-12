//
//  Drinks.h
//  PersonalBartender
//
//  Created by Rafal Kampa on 10.05.2016.
//  Copyright © 2016 Marcin Mielniczek. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@protocol Drinks

@end
@interface Drinks : JSONModel

@property (nonatomic, strong)NSString *details;
@property (nonatomic, strong)NSString *image;
@property (nonatomic, strong)NSString *name;


@end
