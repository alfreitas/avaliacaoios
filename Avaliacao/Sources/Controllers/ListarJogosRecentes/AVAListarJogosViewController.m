//
//  AVAListarJogosRecentesViewController.m
//  Avaliacao
//
//  Created by PiciOS2016 on 7/13/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//

#import "AVAListarJogosViewController.h"
#import "AVADownloadImageView.h"
#import "AVASteamService.h"
#import "AVAGameTableViewCell.h"
@interface AVAListarJogosRecentesViewController (){
NSMutableArray<AVAGame> *listaGames;
AVASteamService *service;
    NSString *steamId;
}
@property (weak, nonatomic) IBOutlet UITableView *tblJogosRecentes;
@property (weak, nonatomic) IBOutlet UILabel *lblNome;
@property (weak, nonatomic) IBOutlet AVADownloadImageView *imageProfile;
@property (weak, nonatomic) IBOutlet UISwitch* switchUsuario;
@end

@implementation AVAListarJogosRecentesViewController
static NSString* cellIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    service = [[AVASteamService alloc] init];

   
    // Do any additional setup after loading the view from its nib.
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
       if(!self.profile){
                   [service recuperaInformacaoSteamPorId:[service recuperaSteamIdUsuarioRegistrado] callback:^(NSString *error, NSMutableArray<AVAProfile> *profile) {
            self.profile = profile.firstObject;
            [self preencheCampos];
        }];
    }else{
        [self.tabBarController.tabBar setHidden:YES];
       /* NSMutableArray *newTabs = [NSMutableArray arrayWithArray:self.tabBarController.viewControllers];
        [newTabs removeObjectAtIndex:1];
        [self.tabBarController setViewControllers:newTabs];*/

        [self preencheCampos];
    }
    
}

-(void) preencheCampos{
             steamId = self.profile.steamid;
             [self.imageProfile setUrl:self.profile.avatarmedium];
             [self.lblNome setText:self.profile.realname];
             NSString *steamIdRegistrada = [service recuperaSteamIdUsuarioRegistrado];
             
             [_switchUsuario setOn:[steamIdRegistrada isEqualToString:steamId] animated:YES];
             
             self.tblJogosRecentes.delegate = self;
             self.tblJogosRecentes.dataSource = self;
             [self.tblJogosRecentes registerNib:[UINib nibWithNibName:NSStringFromClass([AVAGameTableViewCell class]) bundle:nil] forCellReuseIdentifier:cellIdentifier];
             [self buscarJogos];
}
         
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return listaGames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AVAGameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    AVAGame *game = listaGames[indexPath.row];
    [cell setNome:game.name];
    [cell setMinutosJogados:game.playtime_forever];
    [cell setUrlJogo:[NSString stringWithFormat:@"http://media.steampowered.com/steamcommunity/public/images/apps/%@/%@.jpg",game.appid,game.img_icon_url]]
    ;
    
    return cell;
}

- (IBAction)gravaUsuario:(UISwitch *)sender {
    if(sender.on){
        [service gravaUsuarioRegistrado:steamId];
    }else{
        [service excluiUsuarioRegistrado:steamId];
    }
}

-(void) buscarJogos{
    listaGames = nil;
    //UIView *view = [[UIView alloc] initWithFrame:self.view.frame];
    //[view setBackgroundColor:[UIColor lightGrayColor]];
    // [view setAlpha:0.5];
    //[self.view addSubview:view];
    //[self.progress startAnimating];
    [service recuperaJogosRecentesSteamPorId:steamId callback:^(NSString *error, NSMutableArray<AVAGame> *arrayJogos) {
        if (error) {
            NSLog(@"Erro");
        }else{
            listaGames = arrayJogos;
            self.profile = nil;
            [self.tblJogosRecentes reloadData];
            
        }
        
    }];
}

@end
