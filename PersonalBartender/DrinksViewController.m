//
//  DrinksViewController.m
//  PersonalBartender
//
//  Created by Marcin Mielniczek on 4/28/16.
//  Copyright © 2016 Marcin Mielniczek. All rights reserved.
//

#import "DrinksViewController.h"
#import "DrinksTableViewCell.h"
#import "DetailsViewController.h"
#import "Defines.h"

@interface DrinksViewController () <UISearchBarDelegate, UISearchDisplayDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableViewDrinks;
@property (nonatomic, strong) Drinks *selectedDrink;
@property (nonatomic, strong) NSMutableArray *searchingData;
@property (nonatomic, assign) BOOL wasFiltered;


@end

@implementation DrinksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //REGISTERING XIB//
    [self.tableViewDrinks registerNib:[UINib nibWithNibName:[[DrinksTableViewCell class] description] bundle:nil] forCellReuseIdentifier:[[DrinksTableViewCell class]description]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

    // TABLE VIEW //
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DrinksTableViewCell *cell = [self.tableViewDrinks dequeueReusableCellWithIdentifier:[[DrinksTableViewCell class] description]];
    
    //CREATING ROWS - RELATING TO XIB//
    if (self.searchDisplayController.active){
        Alcohols *alcohol = [[Alcohols alloc] init];
        alcohol.drinks = self.searchingData.mutableCopy;
        
        [cell customizeWithTitle:alcohol.drinks[indexPath.row]];
        self.wasFiltered = YES;
    }else{
        [cell customizeWithTitle:self.selectedTitle.drinks[indexPath.row]];
        self.wasFiltered = NO;
        
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.searchDisplayController.active) {
        return self.searchingData.count;
    }else{
        return self.selectedTitle.drinks.count;
        
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //SETTING OBJECT TO TRANSFERE//
    
    if (self.wasFiltered && self.searchingData.count > 0) {
        self.selectedDrink = self.searchingData[indexPath.row];
    }else{
        self.selectedDrink = self.selectedTitle.drinks[indexPath.row];
    }

    //MAKING SEGUE TO ANOTHER VIEW CONTROLLER//
    [self performSegueWithIdentifier:segueDetails sender:self];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 85;
}

#pragma mark - search items

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope{
    
    NSPredicate *drinkPredicate = [NSPredicate predicateWithFormat:predicateFormat, searchText];
    
    self.searchingData = [NSMutableArray arrayWithArray:[self.selectedTitle.drinks filteredArrayUsingPredicate:drinkPredicate]];

}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    return YES;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:segueDetails]){
        DetailsViewController *vc = [segue destinationViewController];
        vc.selectedDrink = self.selectedDrink;
    }
}


@end
