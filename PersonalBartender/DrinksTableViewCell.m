//
//  DrinksTableViewCell.m
//  PersonalBartender
//
//  Created by Marcin Mielniczek on 4/30/16.
//  Copyright © 2016 Marcin Mielniczek. All rights reserved.
//

#import "DrinksTableViewCell.h"

@interface DrinksTableViewCell()
@property (strong, nonatomic) IBOutlet UILabel *labelDrinkName;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewDrink;



@end

@implementation DrinksTableViewCell

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
- (void)customizeWithTitle:(NSString *)title{
    self.labelDrinkName.text = title;
    self.imageViewDrink.image = [UIImage imageNamed:title];
}

@end
