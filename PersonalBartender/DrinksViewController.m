//
//  DrinksViewController.m
//  PersonalBartender
//
//  Created by Marcin Mielniczek on 4/28/16.
//  Copyright © 2016 Marcin Mielniczek. All rights reserved.
//

#import "DrinksViewController.h"
#import "DrinksTableViewCell.h"

@interface DrinksViewController () <UISearchBarDelegate, UISearchDisplayDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableViewDrinks;
@property (nonatomic, strong)NSString *selectedDrink;
@property (nonatomic, strong)NSMutableArray *displayedArray;
@property (nonatomic, strong) NSMutableArray *searchingData;


@end

@implementation DrinksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //REGISTERING XIB//
    
    [self.tableViewDrinks registerNib:[UINib nibWithNibName:[[DrinksTableViewCell class] description] bundle:nil] forCellReuseIdentifier:[[DrinksTableViewCell class]description]];
    
    //VODKA//
    NSMutableArray *vodkaArray = [[NSMutableArray alloc]initWithObjects:@"Sex on the beach",@"Vodka Sour", @"Cosmopolitan",@"Appletini",@"Vodka Martini",@"Black Russian",@"White Russian",@"Bloody Mary",@"Blue Lagoon",@"Caipiroska",@"Caipirinha",@"Espresso Martini",@"Long Island Ice Tea",@"Moscow Mule", @"Screwdriver", nil];
    
    //RUM//
    NSMutableArray *rumArray = [[NSMutableArray alloc]initWithObjects:@"Cuba Libre", @"Mojito" ,@"Daiquiri", @"Banana Daiquiri", @"Strawberry Daiquiri", @"Mojito Raspberry",@"Mojito Mango",@"Mojito Passionfruit",@"Pina Colada",@"Mai Tai",@"Egg Nogg",@"The Hemingway Daiquiri", @"El Presidente",@"Hurricane",@"Planter Punch",@"Dark and Stormy", nil];
    
    //GIN//
    NSMutableArray *ginArray = [[NSMutableArray alloc]initWithObjects:@"Basil Smash",@"Tom Collins",@"Tom Collins Cucumber",@"Singapore Sling",@"Gin Martini",@"Negroni",@"Gin&Tonic",@"French 75",@"Classic Gin Fizz",@"The Clover Club",@"Martinez", nil];
    
    //WHISKY//
    NSMutableArray *whiskyArray = [[NSMutableArray alloc]initWithObjects:@"Whisky Sour",@"Old Fashioned",@"Sazerac",@"Mint Julep",@"Manhattan",@"Rob Roy",@"Sea's Captain Special",@"Suburban",@"Sriracha Hot Toddy",@"Presbyterian",@"John Collins",@"Blood and Sand",@"The Revolver", nil];
    
    //TEQUILA//
    NSMutableArray *tequilaArray = [[NSMutableArray alloc]initWithObjects:@"Tequila Sunrise",@"Margerita",@"Strawberry Margerita",@"Rodriguez Sour",@"The Federation",@"The Charming Foxhole",@"Tequila Slammer",@"The Mars Water",@"Mojalisco",@"El Diablo", nil];
    
    // SETTINGS ARRAY TO DISPLAY //
    self.displayedArray = [NSMutableArray new];
    if ([self.selectedTitle isEqualToString:@"Vodka"]) {
        self.displayedArray = vodkaArray;
    }
    else if ([self.selectedTitle isEqualToString:@"Rum"]){
        self.displayedArray = rumArray;
    }
    else if ([self.selectedTitle isEqualToString:@"Gin"]){
        self.displayedArray = ginArray;
    }
    else if ([self.selectedTitle isEqualToString:@"Whisky"]){
        self.displayedArray = whiskyArray;
    }
    else{
        
        self.displayedArray = tequilaArray;
    }
    [self.displayedArray sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// TABLE VIEW //
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DrinksTableViewCell *cell = [self.tableViewDrinks dequeueReusableCellWithIdentifier:[[DrinksTableViewCell class] description]];
    
    //CREATING ROWS - RELATING TO XIB//
    if (self.searchDisplayController.active){
        [cell customizeWithTitle:self.searchingData[indexPath.row]];
    }else{
        [cell customizeWithTitle:self.displayedArray[indexPath.row]];
    }

    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.searchDisplayController.active) {
        return self.searchingData.count;
    }else{
        return self.displayedArray.count;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //USTAWIANIE OBIEKTU DO PRZESLANIA
    self.selectedDrink = self.displayedArray[indexPath.row];
    
    //ROBISZ PRZEJSCIE
    [self performSegueWithIdentifier:@"showDetails" sender:self];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 85;
}

#pragma mark - search items

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope{
    
    NSPredicate *drinkPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@", searchText];
    self.searchingData = [NSMutableArray arrayWithArray:[self.displayedArray filteredArrayUsingPredicate:drinkPredicate]];

}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    return YES;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
