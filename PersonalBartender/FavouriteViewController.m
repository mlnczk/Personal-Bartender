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
@property (nonatomic, strong)Drinks *selectedDrink;

@end

@implementation FavouriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.arrayFavourites = [defaults objectForKey:@"favourites"];
    
    //REGISTERING XIB//
    [self.tableViewFavourites registerNib:[UINib nibWithNibName:[[DrinksTableViewCell class] description] bundle:nil] forCellReuseIdentifier:[[DrinksTableViewCell class]description]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (Drinks *)drinksWithIndexPath:(NSIndexPath *)indexPath{
    Drinks *drinks = [[Drinks alloc]initWithDictionary:self.arrayFavourites[indexPath.row] error:nil];
    return drinks;
}

// TABLE VIEW //
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DrinksTableViewCell *cell = [self.tableViewFavourites dequeueReusableCellWithIdentifier:[[DrinksTableViewCell class] description]];
    
    [cell customizeWithTitle:[self drinksWithIndexPath:indexPath]];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 85;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.arrayFavourites.count;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //SETTING OBJECT TO TRANSFERE
    self.selectedDrink = [self drinksWithIndexPath:indexPath];
    
    //MAKING SEGUE TO ANOTHER VC
    [self performSegueWithIdentifier:@"showFavourites" sender:self];
}









#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showFavourites"]){
        DetailsViewController *vc = [segue destinationViewController];
        vc.selectedDrink = self.selectedDrink;
    }
}


@end
