//
//  DetailsViewController.m
//  PersonalBartender
//
//  Created by Marcin Mielniczek on 4/28/16.
//  Copyright © 2016 Marcin Mielniczek. All rights reserved.
//

#import "DetailsViewController.h"
#import "ModelDataViewController.h"


@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelDrinkName;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewDrink;
@property (weak, nonatomic) IBOutlet UILabel *labelDrinkDetails;


@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.labelDrinkName.text = self.selectedDrink.name;
    self.imageViewDrink.image = [UIImage imageNamed:self.selectedDrink.image];
    self.labelDrinkDetails.text = self.selectedDrink.details;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)addToFavourite:(id)sender {
    NSMutableArray *arrayFavourites = [NSMutableArray new];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    arrayFavourites = [[defaults objectForKey:@"favourites"] mutableCopy];
    
    if (!arrayFavourites) {
        arrayFavourites = [NSMutableArray new];
    }
    NSMutableDictionary *dict = [NSMutableDictionary new];
    [dict setObject:self.labelDrinkName.text forKey:@"name"];
    [dict setObject:self.selectedDrink.image forKey:@"image"];
    [dict setObject:self.labelDrinkDetails.text forKey:@"details"];
    [arrayFavourites addObject:dict];
    
    [defaults setObject:arrayFavourites forKey:@"favourites"];
    [defaults synchronize];
    
    	
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
