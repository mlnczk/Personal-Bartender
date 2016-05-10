//
//  ModelData.m
//  PersonalBartender
//
//  Created by Marcin Mielniczek on 5/10/16.
//  Copyright © 2016 Marcin Mielniczek. All rights reserved.
//

#import "ModelData.h"

@implementation ModelData


- (NSArray *)loadData{
    NSMutableArray *array = [NSMutableArray new];
    
    NSMutableDictionary *vodka = [NSMutableDictionary new];
    
    [vodka setObject:@"kampa.rafal@interia.pl" forKey:@"email"];
    [dict1 setObject:@"Kampa" forKey:@"lastName"];
    [dict1 setObject:@"Rafał" forKey:@"firstName"];
    [dict1 setObject:@"encepence" forKey:@"password"];
    
    NSMutableDictionary *dict2 = [NSMutableDictionary new];
    
    [dict2 setObject:@"jan.kowalski@icloud.com" forKey:@"email"];
    [dict2 setObject:@"Kowalski" forKey:@"lastName"];
    [dict2 setObject:@"Jan" forKey:@"firstName"];
    [dict2 setObject:@"123qwer" forKey:@"password"];
    
    NSMutableDictionary *dict3 = [NSMutableDictionary new];
    
    [dict3 setObject:@"dupa.dupa@gmail.com" forKey:@"email"];
    [dict3 setObject:@"Dupa" forKey:@"lastName"];
    [dict3 setObject:@"Dupa" forKey:@"firstName"];
    [dict3 setObject:@"asdfgh123" forKey:@"password"];
    
    NSMutableDictionary *dict4 = [NSMutableDictionary new];
    
    [dict4 setObject:@"gosia.ptosia.pl" forKey:@"email"];
    [dict4 setObject:@"Ptosia" forKey:@"lastName"];
    [dict4 setObject:@"Gosia" forKey:@"firstName"];
    [dict4 setObject:@"zaqwsx123" forKey:@"password"];
    
    NSMutableDictionary *dict5 = [NSMutableDictionary new];
    
    [dict5 setObject:@"dalia6@interia.pl" forKey:@"email"];
    [dict5 setObject:@"Delewska" forKey:@"lastName"];
    [dict5 setObject:@"Dalia" forKey:@"firstName"];
    [dict5 setObject:@"zxcvbnmlkjhgfdsaqwertyuiop12345" forKey:@"password"];
    
    
    [array addObject:dict1];
    [array addObject:dict2];
    [array addObject:dict3];
    [array addObject:dict4];
    [array addObject:dict5];
    
    
    
    return array;
}


@end
