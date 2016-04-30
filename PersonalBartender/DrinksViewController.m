//
//  DrinksViewController.m
//  PersonalBartender
//
//  Created by Marcin Mielniczek on 4/28/16.
//  Copyright © 2016 Marcin Mielniczek. All rights reserved.
//

#import "DrinksViewController.h"
#import "DrinksTableViewCell.h"

@interface DrinksViewController ()
@property (strong, nonatomic) IBOutlet UISearchBar *searchBarDrinks;
@property (strong, nonatomic) IBOutlet UITableView *tableViewDrinks;
@property (nonatomic, strong)NSString *selectedDrink;
@property (nonatomic, strong)NSArray *displayedArray;
@property (nonatomic, strong)NSArray *searchResults;



@end

@implementation DrinksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //rejestrowanie XIB'a
    [self.tableViewDrinks registerNib:[UINib nibWithNibName:[[DrinksTableViewCell class] description] bundle:nil] forCellReuseIdentifier:[[DrinksTableViewCell class]description]];
    //VODKA ARRAY//
    NSMutableArray *vodkaArray = [[NSMutableArray alloc]initWithObjects:@"Sex on the beach",@"Vodka Sour", @"Cosmopolitan",@"Appletini",@"Vodka Martini",@"Black Russian",@"White Russian",@"Bloody Mary",@"Blue Lagoon",@"Caipiroska",@"Caipirinha",@"Espresso Martini",@"Long Island Ice Tea",@"Moscow Mule", @"Scredriver", nil];
    [vodkaArray sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    
    self.displayedArray = [NSArray new];
    if ([self.selectedTitle isEqualToString:@"Vodka"]) {
        self.displayedArray = vodkaArray;
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// TABLE VIEW //
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DrinksTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[[DrinksTableViewCell class] description]];
    //TWORZENIE RZEDOW ODWOLUJESZ SIE DO XIB
    [cell customizeWithTitle:self.displayedArray[indexPath.row]];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [self.searchResults count];
        
    } else {
        return [self.displayedArray count];
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //USTAWIANIE OBIEKTU DO PRZESLANIA
    self.selectedDrink = self.displayedArray[indexPath.row];
    
    //ROBISZ PRZEJSCIE
    [self performSegueWithIdentifier:@"showDetails" sender:self];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}





// SEARCH BAR //
- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"name contains[c] %@", searchText];
    self.searchResults = [self.displayedArray filteredArrayUsingPredicate:resultPredicate];
}
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
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
