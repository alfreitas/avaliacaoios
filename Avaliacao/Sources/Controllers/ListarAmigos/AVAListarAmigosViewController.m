//
//  AVAListarAmigosViewController.m
//  Avaliacao
//
//  Created by PiciOS2016 on 7/10/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//

#import "AVAListarAmigosViewController.h"
#import "AVAProfile.h"
#import "AVASteamService.h"
#import "AVAProfileViewCell.h"
#import "AVAListarJogosViewController.h"
#import "AVADownloadImageView.h"
@interface AVAListarAmigosViewController (){
    NSMutableArray<AVAProfile> *listaProfiles;
    AVASteamService *service;
}
@property (weak, nonatomic) IBOutlet UITableView *tblAmigos;
@property (weak, nonatomic) IBOutlet AVADownloadImageView *imageViewUsuario;
@property (weak, nonatomic) IBOutlet UILabel *lblNomeUsuarioRegistrado;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *progress;

@end

@implementation AVAListarAmigosViewController
static NSString* cellIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    service = [[AVASteamService alloc] init];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tblAmigos.delegate = self;
    self.tblAmigos.dataSource = self;
    self.tblAmigos.bounces=true;
    [self.progress hidesWhenStopped];
    [self.tblAmigos registerNib:[UINib nibWithNibName:NSStringFromClass([AVAProfileViewCell class]) bundle:nil] forCellReuseIdentifier:cellIdentifier];
    [self atualizaInformacoes:[service recuperaSteamIdUsuarioRegistrado]];
    [self buscarAmigos];
    self.tblAmigos.contentInset = UIEdgeInsetsMake(0 , 0, CGRectGetHeight(self.tabBarController.tabBar.frame), 0);
    self.tblAmigos.scrollIndicatorInsets  = UIEdgeInsetsMake(0 , 0, CGRectGetHeight(self.tabBarController.tabBar.frame), 0);
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [self.tabBarController.tabBar setHidden:NO];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AVAProfile *profile = listaProfiles[indexPath.row];
    AVAListarJogosViewController *jogos = [[AVAListarJogosViewController alloc] init];
    [jogos setProfile:profile];
    
    [self.navigationController pushViewController:jogos animated:YES];
   /* PICCarro *carro = listaCarros[indexPath.row];
    PICDetalhesCarroViewController *detalhe = [[PICDetalhesCarroViewController alloc] init];
    [detalhe setCarro:carro];
    
    [self.navigationController pushViewController:detalhe animated:YES];*/
}
- (IBAction)cliqueAtualizar:(UIButton *)sender {
      [self atualizaInformacoes:[service recuperaSteamIdUsuarioRegistrado]];
      [self buscarAmigos];
}

-(void)atualizaInformacoes:(NSString*) stringid{
    [service recuperaInformacaoSteamPorId:stringid callback:^(NSString *error, NSMutableArray<AVAProfile> *profiles) {
        AVAProfile *profile = profiles.firstObject;
        [_lblNomeUsuarioRegistrado setText:profile.personaname];
        [_imageViewUsuario setUrl:profile.avatarmedium];
    }];
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return listaProfiles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AVAProfileViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    AVAProfile *profile = listaProfiles[indexPath.row];
    [cell setNome:profile.personaname];
    [cell setNickName:profile.personaname];
    [cell setUrlAvatar:profile.avatar];
    if(profile.personastate !=nil){
    [cell setStatus:(Status)[profile.personastate intValue]];
    }else{
    [cell setStatus:Offline];
    }
    return cell;
}

- (void) buscarAmigos{
    listaProfiles = nil;
    UIView *view = [[UIView alloc] initWithFrame:self.view.frame];
    [view setBackgroundColor:[UIColor lightGrayColor]];
    [view setAlpha:0.5];
    [self.view addSubview:view];
    [self.progress startAnimating];
    

    [service recuperaAmigosPorId:[service recuperaSteamIdUsuarioRegistrado] callback:^(NSString *error, NSMutableArray<AVAAmigo> *arrayAmigos) {
        if (error) {
            NSLog(@"Erro");
        }else{
            listaProfiles = [[NSMutableArray<AVAProfile> alloc] init];
            __block NSInteger count = 0;
            //dispatch_semaphore_t sema = dispatch_semaphore_create(0);
            
            for (AVAAmigo *ava in arrayAmigos) {
                
                [service recuperaInformacaoSteamPorId:ava.steamid callback:^(NSString *error, NSMutableArray<AVAProfile> *profile) {
                    [listaProfiles addObjectsFromArray:profile];
                    count = count + 1;
                    if(count == arrayAmigos.count){
                        [self.progress stopAnimating];
                        [view removeFromSuperview];
                        [self.tblAmigos reloadData];
                    }
                    
                 //   dispatch_semaphore_signal(sema);
                }];
            //    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
                
               
                // do stuff
            }

            
            
            
            
        }

    }];
}


@end
