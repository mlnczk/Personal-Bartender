//
//  AlcoholViewController.m
//  PersonalBartender
//
//  Created by Marcin Mielniczek on 4/28/16.
//  Copyright © 2016 Marcin Mielniczek. All rights reserved.
//
#import "AlcoholTableViewCell.h"
#import "AlcoholViewController.h"
#import "DrinksViewController.h"

@interface AlcoholViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableViewAlcohols;
@property (nonatomic, strong) NSArray *arrayAlcohols;
@property (nonatomic, strong) NSString *selectedTitle;


@end

@implementation AlcoholViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //REGISTERING XIB//
    [self.tableViewAlcohols registerNib:[UINib nibWithNibName:[[AlcoholTableViewCell class] description] bundle:nil] forCellReuseIdentifier:[[AlcoholTableViewCell class]description]];
    self.arrayAlcohols = [[NSArray alloc]initWithObjects:@"Vodka", @"Rum", @"Whisky", @"Gin",@"Tequila", nil];
    [self.tableViewAlcohols reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AlcoholTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[[AlcoholTableViewCell class] description]];
    //TWORZENIE RZEDOW ODWOLUJESZ SIE DO XIB
    [cell customizeWithTitle:self.arrayAlcohols[indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayAlcohols.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //USTAWIANIE OBIEKTU DO PRZESLANIA
    self.selectedTitle = self.arrayAlcohols[indexPath.row];
    
    //ROBISZ PRZEJSCIE
    [self performSegueWithIdentifier:@"showCocktails" sender:self];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showCocktails"]) {
        DrinksViewController *vc = [segue destinationViewController];
        vc.selectedTitle = self.selectedTitle;
    }
}


@end