function storeoutput(NewYear)
%
% Add variables to the returned output structure so that the user may work
% with them (or save them) at the command line after running the model.
%

global veg site clim out share rstep ystep;


% Store iteration step variables (these may be monthly, daily etc. based on
% the stepping of the input climate data)
if NewYear==0
  out.grosspsn    (rstep) = share.GrsPsnMo;
  out.netpsn      (rstep) = share.NetPsnMo;
  out.netcbal     (rstep) = share.NetCBal;
  out.vpd         (rstep) = share.VPD;
  out.folmass     (rstep) = share.FolMass;
  out.plantnMo    (rstep) = share.PlantN;
  
  % Timestep Carbon cycle
  out.plantcMo     (rstep) = share.PlantC;      % TTR
  out.budcMo       (rstep) = share.BudC;        % TTR
  out.woodcMo      (rstep) = share.WoodC;       % TTR
  out.rootcMo      (rstep) = share.RootC;       % TTR
  out.RootCAddMo   (rstep) = veg.RootAllocA * (share.dayspan(rstep) / 365.0) + veg.RootAllocB * share.FolProdCMo; % TTR
  out.WoodMRespMo  (rstep) = share.WoodMRespMo; % TTR
  out.WoodGRespMo  (rstep) = share.WoodGRespMo; % TTR
  out.FolGRespMo   (rstep) = share.FolGRespMo;  % TTR
  out.WoodCProdMo  (rstep) = share.WoodCProdMo; % TTR
  out.folprodcMo   (rstep) = share.FolProdCMo;  % TTR
  out.lai          (rstep) = share.CurrentLAI;  % TTR
  out.plantcfastMo (rstep) = share.PlantCfast;  % TTR
  out.plantcslowMo (rstep) = share.PlantCslow;  % TTR
end


% Store annual variables at the conclusion of each years run
if NewYear==1
  out.nppfol  (ystep) = share.NPPFolYr;
  out.nppwood (ystep) = share.NPPWoodYr;
  out.npproot (ystep) = share.NPPRootYr;
  out.nep     (ystep) = share.NEP;
  out.gpp     (ystep) = share.TotGrossPsn;
  
  % Water cycle
  out.waterstress (ystep) = share.DWater;% zzx
  out.trans       (ystep) = share.TotTrans;
  out.soilwater   (ystep) = share.TotWater;
  out.psn         (ystep) = share.TotPsn;
  out.drain       (ystep) = share.TotDrain;
  out.prec        (ystep) = share.TotPrec;
  out.evap        (ystep) = share.TotEvap;
  out.et          (ystep) = share.TotTrans + share.TotEvap;
  
  % Carbon cycle
  out.plantc    (ystep) = share.PlantC;
  out.budc      (ystep) = share.BudC;
  out.woodc     (ystep) = share.WoodC;
  out.rootc     (ystep) = share.RootC;
  out.folm      (ystep) = share.FolMass;
  out.deadwoodm (ystep) = share.DeadWoodM ;
  out.woodm     (ystep) = share.WoodMass;
  out.rootm     (ystep) = share.RootMass;
  out.hom       (ystep) = share.HOM;
  out.hon       (ystep) = share.HON;  
  out.ndep      (ystep) = share.NdepTot;  	 
  
  % Nitrogen cycle
  out.plantnYr     (ystep) = share.PlantN;
  out.budn         (ystep) = share.BudN;
  out.ndrain       (ystep) = share.NDrainYr;
  out.netnmin      (ystep) = share.NetNMinYr;
  out.grossnmin    (ystep) = share.GrossNMinYr;
  out.nplantuptake (ystep) = share.PlantNUptakeYr;
  out.grossnimob   (ystep) = share.GrossNImmobYr;
  out.littern      (ystep) = share.TotalLitterNYr;
  out.netnitrif    (ystep) = share.NetNitrYr;
  out.nratio       (ystep) = share.NRatio;
  out.foln         (ystep) = share.FolNConOld;
  
  % TBCA
  out.litm    (ystep) = share.TotalLitterMYr;
  out.litn    (ystep) = share.TotalLitterNYr;
  out.rmresp  (ystep) = share.RootMRespYr;
  out.rgresp  (ystep) = share.RootGRespYr;
  out.decresp (ystep) = share.SoilDecRespYr;
      
  % Additional variables % TTR
  out.woodprodcYr (ystep) = share.WoodProdCYr; % TTR
  out.folprodcYr  (ystep) = share.FolProdCYr;  % TTR
  
  %advance year counter
  ystep = ystep + 1;
end