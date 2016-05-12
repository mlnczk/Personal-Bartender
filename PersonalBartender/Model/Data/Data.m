//
//  Data.m
//  PersonalBartender
//
//  Created by Rafal Kampa on 10.05.2016.
//  Copyright © 2016 Marcin Mielniczek. All rights reserved.
//

#import "Data.h"

@implementation Data

+ (NSArray *)getData{
    NSMutableArray *arrayWithDrinks = [NSMutableArray new];

    NSMutableArray *vodkaNamesArray = [[NSMutableArray alloc]initWithObjects:@"Sex On The Beach",@"Vodka Sour", @"Cosmopolitan",@"Appletini",@"Vodka Martini",@"Black Russian",@"White Russian",@"Bloody Mary",@"Blue Lagoon",@"Caipiroska",@"Caipirinha",@"Espresso Martini",@"Long Island Ice Tea",@"Moscow Mule", @"Screwdriver", nil];
    [vodkaNamesArray sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    NSMutableArray *vodkaDetails = [[NSMutableArray alloc]initWithObjects:@"-40ml vodka\n-20ml malibu\n-20ml archers\n-topup orange juice\n-splash of grenadine",@"-40ml vodka\n-20ml lemon juice\n-20ml simple sirop\n-lemon zest",@"-40ml vodka\n-20ml cointreau\n-20ml lime juice\n-30ml cranberry juice\n-orange zest",@"-40ml vodka\n-30ml cider\n-15ml cointreau",@"-40ml vodka\n-20ml dry vermouth\n-lemon zest",@"-40ml vodka\n-20ml kahlua\n-coffee seeds",@"-40ml vodka\n-20ml kahlua\n-30ml white cream 30%",@"-40ml vodka\n-15ml lemon juice\n-10ml simple sirop\n-topup tomato juice\n-pepper and salt\n-tabascco",@"-40ml vodka\n-20ml blue curacao liquer\n-topup sprite",@"-40ml vodka\n-2 tablespoons of sugar\n-4parts of lime\n-crushed ice",@"-40ml cachaca\n-2 tablespoons of sugar\n-4 parts of lime\n-crushed ice",@"-40ml vodka\n-15ml kahlua\n-1 espresso\n-15ml vanilla sirop",@"-20ml vodka\n-20ml rum\n-20ml tequilla\n-20ml gin\n-20ml cointreau\n-20ml lemon juice\n-20ml orange juice\n-splash of cola",@"-40ml vodka\n-4 parts of lime\n-topup ginger beer",@"-50ml vodka\n-topup orange juice", nil];
    
    
    NSMutableArray *vodkaArray = [NSMutableArray new];
    for (int i = 0; i <vodkaNamesArray.count; i++) {
        NSMutableDictionary *dict = [NSMutableDictionary new];
        [dict setObject:vodkaNamesArray[i] forKey:@"name"];
        [dict setObject:vodkaNamesArray[i] forKey:@"image"];
        [dict setObject:vodkaDetails[i] forKey:@"details"];
        [vodkaArray addObject:dict];
    }
    [arrayWithDrinks addObject:vodkaArray];
    
    //RUM//
    NSMutableArray *rumNamesArray = [[NSMutableArray alloc]initWithObjects:@"Cuba Libre", @"Mojito" ,@"Daiquiri", @"Banana Daiquiri", @"Strawberry Daiquiri", @"Mojito Raspberry",@"Mojito Mango",@"Mojito Passionfruit",@"Pina Colada",@"Mai Tai",@"Egg Nogg",@"The Hemingway Daiquiri", @"El Presidente",@"Hurricane",@"Planter Punch",@"Dark and Stormy", nil];
    [rumNamesArray sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    NSMutableArray *rumDetails = [[NSMutableArray alloc]initWithObjects:@"-40ml rum\n-4 parts of lime\n-topup cola",@"-40ml rum\n-4 parts of lime\n-2 tablespoons of sugar\n-6 leafs of mint\n-topup carbonated water\n-crushed ice\n",@"-40ml rum\n-20ml lime juice\n-20ml simple sirop",@"-40ml rum\n-20ml lime juice\n-20ml banana puree",@"-40ml rum\n-20ml lime juice\n-20ml strawberry puree",@"-40ml rum\n-4 parts of lime\n-20ml raspberry puree\n-6 leafs of mint\n-splash of carbonated water\n-crushed ice",@"-40ml rum\n-4 parts of lime\n-20ml mango puree\n-6 leafs of mint\n-splash of carbonated water\n-crushed ice",@"-40ml rum\n-4 parts of lime\n-20ml passionfruit puree\n-6 leafs of mint\n-splash of carbonated water\n-crushed ice",@"-40ml rum\n-20ml malibu\n-20ml coconut puree\n-40ml pinapple juice\n-40ml milk",@"-30ml white rum\n-3parts of lime\n-20ml orgeat sirop\n-20ml topup dark rum\n-crushed ice",@"-40ml dark rum\n-20ml heavy cream\n-10ml cinnamon sirop\n-10ml vanilla sirop\n-whole egg",@"-40ml rum\n-20ml lime juice\n-30ml grapefruit juice\n-15ml maraschino liquer\n-grapefruit zest",@"-40ml white rum\n-15ml dry vermouth\n-15ml cointreau\n-splash of grenadine",@"-20ml white rum\n-20ml dark rum\n-20ml lime juice\n-20ml orange juice\n-10ml passionfruit puree\n-10ml grenadine sirop",@"-40ml dark rum\n-30ml orange juice\n-40ml pinapple juice\n-20ml lemon juice\n-10ml grenadine sirop\n-10ml simple sirop\n-4 dashes of angostura",@"-40ml dark rum\n-100ml ginger beer\n-20ml lime juice", nil];
    
    NSMutableArray *rumArray = [NSMutableArray new];
    for (int i = 0; i <rumNamesArray.count; i++) {
        NSMutableDictionary *dict = [NSMutableDictionary new];
        [dict setObject:rumNamesArray[i] forKey:@"name"];
        [dict setObject:rumNamesArray[i] forKey:@"image"];
        [dict setObject:rumDetails[i] forKey:@"details"];
        [rumArray addObject:dict];
    }
    [arrayWithDrinks addObject:rumArray];
    
    //GIN//
    NSMutableArray *ginNamesArray = [[NSMutableArray alloc]initWithObjects:@"Basil Smash",@"Tom Collins",@"Tom Collins Cucumber",@"Singapore Sling",@"Gin Martini",@"Negroni",@"Gin&Tonic",@"French 75",@"Classic Gin Fizz",@"The Clover Club",@"Martinez", nil];
    [ginNamesArray sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    NSMutableArray *ginDetails = [[NSMutableArray alloc]initWithObjects:@"-40ml gin\n-3 parts of lime\n -6 leafs of basil\n -2 tablespoons of sugar",@"-40ml gin\n-20ml lemon juice\n-20ml simple sirop\n-topup carbonated water",@"-40ml gin\n-20ml lemon juice\n-20ml cucumber sirop\n-topup carbonated water\n-2 slices of cucumber",@"-30ml gin\n-15ml maraschino liqueur\n-15ml cointreau\n-15ml lime juice\n-10ml sirop grenadine\n-2 dashes of angostura\n-40ml pinapple juice",@"-50ml gin\n-25ml dry vermouth\n-3 olives",@"-30ml gin\n-30ml campari\n-30ml martini rosso\n-orange zest",@"-50ml gin\n-3 parts of lime\n-topup tonic",@"-40ml gin\n-20ml lemon juice\n-10ml simple sirop\n-topup cider",@"-40ml gin\n-20ml lemon juice\n-20ml simple sirop\n-egg white\n-topup carbonated water",@"-45ml gin\n-15ml lemon juice\n-15ml grenadine sirop\n-egg white",@"-40ml gin\n-15ml dry vermouth\n-15ml maraschino liqueur\n-2 dashses of angostura", nil];
    
    NSMutableArray *ginArray = [NSMutableArray new];
    for (int i = 0; i <ginNamesArray.count; i++) {
        NSMutableDictionary *dict = [NSMutableDictionary new];
        [dict setObject:ginNamesArray[i] forKey:@"name"];
        [dict setObject:ginNamesArray[i] forKey:@"image"];
        [dict setObject:ginDetails[i] forKey:@"details"];
        [ginArray addObject:dict];
    }
    [arrayWithDrinks addObject:ginArray];

    //WHISKY//
    NSMutableArray *whiskyNamesArray = [[NSMutableArray alloc]initWithObjects:@"Whisky Sour",@"Old Fashioned",@"Sazerac",@"Mint Julep",@"Manhattan",@"Rob Roy",@"Sea's Captain Special",@"Suburban",@"Sriracha Hot Toddy",@"Presbyterian",@"John Collins",@"Blood and Sand",@"The Revolver", nil];
    [whiskyNamesArray sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    NSMutableArray *whiskyDetails = [[NSMutableArray alloc]initWithObjects:@"-50ml whisky\n-20ml lemon juice\n-20ml simple sirop\n-2 dashes of angostura\n-egg white",@"-50ml whiskey bourbon\n-5dashes of angostura\n-splash of carbonated water\n-orange zest\n-2 tablespoons of sugar",@"-50ml rhy whisky\n-2 tablespoons of sugar\n-2 dashes of angostura\n-2 dashes of peychaut bitters\n-10ml absynth\n-splash of carbonated water",@"-40ml whisky\n-3 parts of lime\n-2 tablespoons of sugar\n-6 leafs of mint\n-splash of carbonated water\n-crushed ice",@"-50ml whisky\n-20ml martini rosso\n-2 dashes of angostura\n-orange zest",@"-50ml scotch whisky\n--20ml martini rosso\n-2 dashes of angostura\n-lemon zest",@"-50ml rhy whisky\n-4 dashes of angostura\n-2 tablespoons of sugar\n-splash of carbonated water\n-10ml absynth\n-splash of champagne",@"-40ml rhy whisky\n-20ml dark rum\n-10ml martini rosso\n-2 dashes of orange bitters\n-1 dash of angostura",@"-40ml whisky\n-80ml boiling water\n-3 inches fresh ginger root\n-4 tablespoons of honey\n-10ml lemon juice\n-1 tablespoon of sriracha sauce",@"-50ml whisky\n-topup ginger ale\n-splash of carbonated water\n",@"-50ml whisky\n-20ml lemon juice\n-20ml simple sirop\n-splash of carbonated water",@"-40ml whisky\n-20ml martini rosso\n-20ml maraschino liqueur\n-orange zest",@"-40ml whiskey bourbon\n-20ml coffee liqueur\n-orange zest",nil];
    
    NSMutableArray *whiskyArray = [NSMutableArray new];
    for (int i = 0; i <whiskyNamesArray.count; i++) {
        NSMutableDictionary *dict = [NSMutableDictionary new];
        [dict setObject:whiskyNamesArray[i] forKey:@"name"];
        [dict setObject:whiskyNamesArray[i] forKey:@"image"];
        [dict setObject:whiskyDetails[i] forKey:@"details"];
        [whiskyArray addObject:dict];
    }
    [arrayWithDrinks addObject:whiskyArray];
    
    //TEQUILA//
    NSMutableArray *tequilaNamesArray = [[NSMutableArray alloc]initWithObjects:@"Tequila Sunrise",@"Margerita",@"Strawberry Margerita",@"Rodriguez Sour",@"The Federation",@"The Charming Foxhole",@"Tequila Slammer",@"The Mars Water",@"Mojalisco",@"El Diablo", nil];
    [tequilaNamesArray sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    NSMutableArray *tequilaDetails = [[NSMutableArray alloc]initWithObjects:@"-50ml tequila\n-topup orange juice\n-splash of grenadine sirop\n",@"-50ml tequila\n-20ml lime juice\n-15ml cointreau\n-crust of salt",@"-50ml tequila\n-20ml lime juice\n-15ml cointreau\n-15ml strawberry puree",@"-50ml tequila\n-20ml simple sirop\n-20ml lemon juice",@"-40ml tequila\n-20ml cacao liqueur\n-2 dashes of angostura\n-orange zest",@"-40ml tequila\n-20ml sweet vermouth\n-2 dashes of peychaud bitters\n-20ml aperol\n-grapefruit zest",@"-50ml tequila\n-topup ginger ale",@"-50ml tequila infused with jalapeno pepper\n-80ml mango juice\n-20ml raspberry puree",@"-40ml tequila\n-4 parts of lime\n-2 tablespoons of sugar\n-6 leafs of mint\n-splash ginger ale\n-crushed ice",@"-40ml tequila\n-20ml blackcurrant liqueur\n-topup ginger beer", nil];
    
    
    NSMutableArray *tequilaArray = [NSMutableArray new];
    for (int i = 0; i <tequilaNamesArray.count; i++) {
        NSMutableDictionary *dict = [NSMutableDictionary new];
        [dict setObject:tequilaNamesArray[i] forKey:@"name"];
        [dict setObject:tequilaNamesArray[i] forKey:@"image"];
        [dict setObject:tequilaDetails[i] forKey:@"details"];
        [tequilaArray addObject:dict];
    }
     [arrayWithDrinks addObject:tequilaArray];
    
    NSArray *alcohols = [[NSArray alloc]initWithObjects:@"Wodka", @"Rum", @"Gin", @"Whisky",@"Tequila", nil];
    NSMutableArray *data = [NSMutableArray new];
    
    for (int i = 0; i < alcohols.count; i++) {
        NSMutableDictionary *dict = [NSMutableDictionary new];
        [dict setObject:alcohols[i] forKey:@"alcoholName"];
        [dict setObject:arrayWithDrinks[i] forKey:@"drinks"];
        [data addObject:dict];
    }
    
    return data;
}

@end
