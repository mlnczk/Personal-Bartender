//
//  FavouriteViewController.m
//  PersonalBartender
//
//  Created by Marcin Mielniczek on 4/29/16.
//  Copyright © 2016 Marcin Mielniczek. All rights reserved.
//

#import "FavouriteViewController.h"
#import "DrinksTableViewCell.h"

@interface FavouriteViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableViewFavourites;
@property (nonatomic, strong)NSMutableArray *arrayFavourites;

@end

@implementation FavouriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //REGISTERING XIB//
    [self.tableViewFavourites registerNib:[UINib nibWithNibName:[[FavouriteViewController class] description] bundle:nil] forCellReuseIdentifier:[[FavouriteViewController class]description]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
// TABLE VIEW //
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FavouriteViewController *cell = [self.tableViewFavourites dequeueReusableCellWithIdentifier:[[FavouriteViewController class] description]];
    
    Alcohols *alcohol = [[Alcohols alloc] init];
    alcohol.drinks = self.arrayFavourites.mutableCopy;

    return cell;
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
