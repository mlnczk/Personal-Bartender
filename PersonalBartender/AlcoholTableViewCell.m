//
//  AlcoholTableViewCell.m
//  PersonalBartender
//
//  Created by Marcin Mielniczek on 4/29/16.
//  Copyright © 2016 Marcin Mielniczek. All rights reserved.
//

#import "AlcoholTableViewCell.h"
#import "Defines.h"

@interface AlcoholTableViewCell()
@property (strong, nonatomic) IBOutlet UILabel *labelAlcoholName;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewAlcohol;


@end

@implementation AlcoholTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)customizeWithTitle:(Alcohols *)alcohol{
    self.labelAlcoholName.text = alcohol.alcoholName;
    self.imageViewAlcohol.image = [UIImage imageNamed:alcohol.alcoholName];
    
//    ADDING PICTURE FROM URL //
    
//    NSURL *url = [NSURL URLWithString:Vodka];
//    NSData *data = [NSData dataWithContentsOfURL:url];
//    UIImage *img = [[UIImage alloc]initWithData:data];
//    self.imageViewAlcohol.image = img;
}

@end
