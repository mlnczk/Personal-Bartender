//
//  DetailsViewController.m
//  PersonalBartender
//
//  Created by Marcin Mielniczek on 4/28/16.
//  Copyright © 2016 Marcin Mielniczek. All rights reserved.
//

#import "DetailsViewController.h"
#import "ModelDataViewController.h"
#import "Defines.h"


@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelDrinkName;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewDrink;
@property (weak, nonatomic) IBOutlet UILabel *labelDrinkDetails;
@property (nonatomic, assign) BOOL isFavourite;
@property (weak, nonatomic) IBOutlet UIButton *buttonFavourite;
@property (weak, nonatomic) IBOutlet UILabel *labelAddFavourite;


@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //JSON MODELLING//
    self.labelDrinkName.text = self.selectedDrink.name;
    self.imageViewDrink.image = [UIImage imageNamed:self.selectedDrink.image];
    self.labelDrinkDetails.text = self.selectedDrink.details;
    
    
    // ADDING FAVOURITES //
    NSMutableArray *arrayFavourites = [self checkFavourites];

    for (int i = 0; i<arrayFavourites.count; i++){
        Drinks *drinks = [[Drinks alloc]initWithDictionary:arrayFavourites[i] error:nil];
        if (drinks.name == self.selectedDrink.name){
            self.buttonFavourite.hidden = YES;
            self.labelAddFavourite.hidden = YES;
            break;
        }else{
            self.buttonFavourite.hidden = NO;
            self.labelAddFavourite.hidden = NO;
        }
        
    }
    
    
}

//USING MEMENTO - BRINGING SAVED COCKTAILS ON DEVICE AND CHECKING IF THEY EXIST //
- (NSMutableArray *)checkFavourites{
    NSMutableArray *arrayFavourites = [NSMutableArray new];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //** ALWAYS MAKE MUTABLE COPY IF MUTABLEARRAY COMES FROM MEMENTO BECAUSE ITS UNCHANGABLE **//
    arrayFavourites = [[defaults objectForKey:favouriteKey] mutableCopy];
    return arrayFavourites;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)addToFavourite:(id)sender {
   NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *arrayFavourites = [self checkFavourites];
    if (!arrayFavourites) {
        arrayFavourites = [NSMutableArray new];
    }
    
    for (int i = 0; i<arrayFavourites.count; i++){
        Drinks *drinks = [[Drinks alloc]initWithDictionary:arrayFavourites[i] error:nil];
        if (drinks.name == self.selectedDrink.name){
            self.isFavourite = YES;
            break;
        }else{
            self.isFavourite = NO;
        }
    }
    
    if (self.isFavourite == NO) {
        
    NSMutableDictionary *dict = [NSMutableDictionary new];
    [dict setObject:self.labelDrinkName.text forKey:keyName];
    [dict setObject:self.selectedDrink.image forKey:keyImage];
    [dict setObject:self.labelDrinkDetails.text forKey:keyDetails];
    [arrayFavourites addObject:dict];
    
    [defaults setObject:arrayFavourites forKey:favouriteKey];
    [defaults synchronize];
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:alertCongratulations
                                                                       message:alertMessage
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:alertOk style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        self.labelAddFavourite.hidden = YES;
        self.buttonFavourite.hidden = YES;
    
    }
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
