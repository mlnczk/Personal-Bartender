//
//  DrinksViewController.m
//  PersonalBartender
//
//  Created by Marcin Mielniczek on 4/28/16.
//  Copyright © 2016 Marcin Mielniczek. All rights reserved.
//

#import "DrinksViewController.h"
#import "DrinksTableViewCell.h"

@interface DrinksViewController ()
@property (strong, nonatomic) IBOutlet UISearchBar *searchBarDrinks;
@property (strong, nonatomic) IBOutlet UITableView *tableViewDrinks;
@property (nonatomic, strong)NSString *selectedDrink;
@property (nonatomic, strong)NSMutableArray *displayedArray;
@property (nonatomic, strong)NSMutableArray *searchResults;



@end

@implementation DrinksViewController

-(NSMutableArray *)displayedArray{
    if (!self.displayedArray){
        self.displayedArray =[[NSMutableArray alloc]init];
    }
         return self.displayedArray;
}
         
         
-(NSMutableArray *)searchResults{
    if(self.searchResults){
        self.searchResults = [[NSMutableArray alloc]init];
    }
    return self.searchResults;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //rejestrowanie XIB'a
    [self.tableViewDrinks registerNib:[UINib nibWithNibName:[[DrinksTableViewCell class] description] bundle:nil] forCellReuseIdentifier:[[DrinksTableViewCell class]description]];
    //DODANIE OBIEKTOW DO ARRAY//
    //VODKA//
    NSMutableArray *vodkaArray = [[NSMutableArray alloc]initWithObjects:@"Sex on the beach",@"Vodka Sour", @"Cosmopolitan",@"Appletini",@"Vodka Martini",@"Black Russian",@"White Russian",@"Bloody Mary",@"Blue Lagoon",@"Caipiroska",@"Caipirinha",@"Espresso Martini",@"Long Island Ice Tea",@"Moscow Mule", @"Screwdriver", nil];
    [vodkaArray sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    //RUM//
    NSMutableArray *rumArray = [[NSMutableArray alloc]initWithObjects:@"Cuba Libre", @"Mojito" ,@"Daiquiri", "@Banana Daiquiri", @"Strawberry Daiquiri", @"Mojito Rasberry",@"Mojito Mango",@"Mojito Passionfruit",@"Pina Colada",@"Mai Tai",@"Egg Nogg",@"The Hemingway Daiquiri", @"El Presidente",@"Hurricane",@"Planter Punch",@"Dark and Stormy", nil];
    [rumArray sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    //GIN//
    NSMutableArray *ginArray = [[NSMutableArray alloc]initWithObjects:@"Basil Smash",@"Tom Collins",@"Tom Collins Cucumber",@"Singapore Sling",@"Gin Martini",@"Negroni",@"Gin&Tonic",@"French 75",@"Classic Gin Fizz",@"The Clover Club",@"Martinez", nil];
    [ginArray sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    //WHISKY//
    NSMutableArray *whiskyArray = [[NSMutableArray alloc]initWithObjects:@"Whisky Sour",@"Old Fashioned",@"Sazerac",@"Mint Julep",@"Manhattan",@"Rob Roy",@"Sea's Captain Special",@"Suburban","@Sriracha Hot Toddy",@"Presbyterian",@"John Collins",@"Blood and Sand",@"The Revolver", nil];
    [whiskyArray sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    //TEQUILA//
    NSMutableArray *tequilaArray = [[NSMutableArray alloc]initWithObjects:@"Tequila Sunrise",@"Margerita",@"Strawberry Margerita",@"Rodriguez Sour",@"The Federation",@"The Charming Foxhole",@"Tequilla Slammer",@" The Mars Water",@"Mojalisco",@"El Diablo", nil];
    [tequilaArray sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    // ustawianie arrayow do wyswietlania //
    
    self.displayedArray = [NSMutableArray new];
    if ([self.selectedTitle isEqualToString:@"Vodka"]) {
        self.displayedArray = vodkaArray;
    }
    else if ([self.selectedTitle isEqualToString:@"Rum"]){
        self.displayedArray = rumArray;
    }
    else if ([self.selectedTitle isEqualToString:@"Gin"]){
        self.displayedArray = ginArray;
    }
    else if ([self.selectedTitle isEqualToString:@"Whisky"]){
        self.displayedArray = whiskyArray;
    }
    else{
        
        self.displayedArray = tequilaArray;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// SEARCH BAR //
// WAZNE PODMIENIA SEARCHBAR FRAZA KTORA SZUKAMY //
-(void)searchThroughData{
    self.searchResults = nil;
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"SELF contains [search] %@",self.searchBarDrinks.text];
    self.searchResults = [[self.displayedArray filteredArrayUsingPredicate:resultPredicate]mutableCopy];
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    [self searchThroughData];
}




// TABLE VIEW //
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DrinksTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[[DrinksTableViewCell class] description]];
    static NSString *CellIdentifier = @"Cell";
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if (!tableView == self.tableViewDrinks){
        cell.textLabel.text = self.displayedArray[indexPath.row];
    }else{
        cell.textLabel.text = self.searchResults[indexPath.row];
    }
    //TWORZENIE RZEDOW ODWOLUJESZ SIE DO XIB
    [cell customizeWithTitle:self.displayedArray[indexPath.row]];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.tableViewDrinks) {
        return [self.displayedArray count];
        
    } else {
        [self searchThroughData];
        return [self.searchResults count];
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //USTAWIANIE OBIEKTU DO PRZESLANIA
    self.selectedDrink = self.displayedArray[indexPath.row];
    
    //ROBISZ PRZEJSCIE
    [self performSegueWithIdentifier:@"showDetails" sender:self];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
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
