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
#import "Data.h"
#import "Alcohols.h"
#import "Defines.h"

@interface AlcoholViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableViewAlcohols;
@property (nonatomic, strong) NSArray *arrayAlcohols;
@property (nonatomic, strong) Alcohols *selectedTitle;


@end

@implementation AlcoholViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //REGISTERING XIB//
    [self.tableViewAlcohols registerNib:[UINib nibWithNibName:[[AlcoholTableViewCell class] description] bundle:nil] forCellReuseIdentifier:[[AlcoholTableViewCell class]description]];
    self.arrayAlcohols = [NSArray new];
    self.arrayAlcohols = [Data getData];
    [self.tableViewAlcohols reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AlcoholTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[[AlcoholTableViewCell class] description]];
    //TWORZENIE RZEDOW ODWOLUJESZ SIE DO XIB
    [cell customizeWithTitle:[self alcoholsWithIndexPath:indexPath]];
    return cell;
}

- (Alcohols *)alcoholsWithIndexPath:(NSIndexPath *)indexPath{
    Alcohols *alcohol = [[Alcohols alloc] initWithDictionary:self.arrayAlcohols[indexPath.row] error:nil];
    return alcohol;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayAlcohols.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //USTAWIANIE OBIEKTU DO PRZESLANIA
    self.selectedTitle = [self alcoholsWithIndexPath:indexPath];
    
    //PERFORMING SEGUE//
    [self performSegueWithIdentifier:segueCocktails sender:self];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:segueCocktails]) {
        DrinksViewController *vc = [segue destinationViewController];
        vc.selectedTitle = self.selectedTitle;
        
    }
}


@end