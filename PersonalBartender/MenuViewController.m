//
//  MenuViewController.m
//  PersonalBartender
//
//  Created by Marcin Mielniczek on 4/28/16.
//  Copyright © 2016 Marcin Mielniczek. All rights reserved.
//

#import "MenuViewController.h"
#import "Defines.h"

@interface MenuViewController ()
@property (strong, nonatomic) IBOutlet UIButton *buttonSearchCocktail;
@property (strong, nonatomic) IBOutlet UIButton *buttonPlayGame;
@property (strong, nonatomic) IBOutlet UIButton *buttonFavourite;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.buttonSearchCocktail.layer.cornerRadius = 8;
    self.buttonPlayGame.layer.cornerRadius = 8;
    self.buttonFavourite.layer.cornerRadius = 8;
    
}

- (void)translation{
    [self.buttonFavourite setTitle:seeFavourite forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)youtubeTapped:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://www.youtube.pl"]];
}

- (IBAction)twitterTapped:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://www.twitter.com"]];
}

- (IBAction)facebookTapped:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://www.facebook.pl"]];
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
