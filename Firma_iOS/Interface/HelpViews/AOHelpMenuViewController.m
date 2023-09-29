//
//  AOHelpMenuViewController.m
//  Firma_iOS
//
//

#import "AOHelpMenuViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "NSMutableAttributedString+Extension.h"

@interface AOHelpMenuViewController ()

@end

@implementation AOHelpMenuViewController

@synthesize tblViewHelp;
NSMutableArray *tableData = NULL;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    
    [self populateTable];
    //definimos los bordes de la tabla.
    self.tblViewHelp.layer.borderWidth = 0.5;
    self.tblViewHelp.layer.borderColor = [[UIColor grayColor] CGColor];
    self.tblViewHelp.layer.cornerRadius = 6.0f;
    self.tblViewHelp.scrollEnabled=NO;
    self.screenName = @"IOS AOHelpMenuViewController - Help menu";
    
    // Help menu description
    NSMutableAttributedString *helpMenuDescriptionAttributedString = [@"help_menu_description_label".localized getHtml:[UIFont systemFontOfSize:14]];
    [helpMenuDescriptionAttributedString align:NSTextAlignmentCenter];
    [self.helpMenuDescriptionLabel setAttributedText:helpMenuDescriptionAttributedString];
    
    [self.helpMenuTitle setText: @"help_menu_title".localized];
    self.title = @"help".localized ;
    
    // Logo
    self.logo.accessibilityLabel = @"logo".localized;
}
- (IBAction)goBackHome:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Carga en la lista de almacenes los almacenes encontrados en Itunes.
-(void)populateTable {
    
    tableData = [[NSMutableArray alloc] init];
    
    [tableData addObject: @"help_acercade".localized];
    [tableData addObject: @"help_instalar_certificados".localized];
    [tableData addObject: @"help_preguntas".localized];
    [tableData addObject: @"accesibility_statement".localized];

}

/******************************************************************/
/******** METODOS IMPLEMENTADOS DE LA TABLA DE CERTIFICADOS *******/
/******************************************************************/

#pragma mark -
#pragma mark Table view data source
// Detalla el numbre de secciones en la tabla.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Detalla el número de filas en la tabla.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [tableData count];
}

// Detalla la apariencia de las celdas.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //Cell View
    CGFloat cellOriginX = 0;
    CGFloat cellOriginY = 0;
    CGFloat cellWidth = 320;
    CGFloat cellHeight = 65;
    UIView *cellView = [[UIView alloc]initWithFrame:CGRectMake(cellOriginX, cellOriginY, cellWidth, cellHeight)];
       
    //Label
    CGFloat lblForOriginX = 10;
    CGFloat lblForOriginY = 15;
    CGFloat lblForWidth = 200;
    CGFloat lblForHeight = 21;
    UILabel *lblFor = [[UILabel alloc]initWithFrame:CGRectMake(lblForOriginX, lblForOriginY, lblForWidth, lblForHeight)];
    lblFor.text = [tableData objectAtIndex:indexPath.row];
    lblFor.backgroundColor = [UIColor clearColor];
    lblFor.font = [UIFont fontWithName:@"ArialMT" size:14];
    lblFor.tag =1;
    
    //Adding Views to Cell View
    [cellView addSubview:lblFor];
    
    for(UIView *view in cell.contentView.subviews){
        if ([view isKindOfClass:[UIView class]]) {
            [view removeFromSuperview];
        }
    }
    
    [cell.contentView addSubview:cellView];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

//Nos devuelve la fila seleccionada.
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int fila = (int)indexPath.row;
    @try {
        if(fila==0)
            [self performSegueWithIdentifier:@"toAcerca" sender:self];
        else if(fila==1)
            [self performSegueWithIdentifier:@"toInstalar" sender:self];
        else if(fila==2)
            [self performSegueWithIdentifier:@"toPregFrecuentes" sender:self];
        else if (fila==3) {
            // Open accesibility statement
            NSURL* accesibiltyUrl = [NSURL URLWithString: @"url_accessibility_statement".localized];
            if( [[UIApplication sharedApplication] canOpenURL:accesibiltyUrl])
                [[UIApplication sharedApplication] openURL:accesibiltyUrl options:@{} completionHandler:nil];
        }
    }
    @catch (NSException *e) {
        // Se ignora
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
}


@end
