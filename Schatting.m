close all
clear
clc

%% plot c-rate dependency
   
figure('Units', 'pixels'                , ...
       'Position', [100 100 800 600]    );
hold on;
colormap = [193, 48, 28; 201, 97, 18 ; 196, 167, 5 ; 23, 114, 69 ; 46, 87, 147 ; 75, 40, 130]./256;
color = 1;
legendHandles = gobjects(0);
    
% input
SoC = 90;
FCE = 20:20:2000;
cRate = 0.2;

for cRate = 0.06:0.18:0.24

    % calculation
    a = 6.2*SoC/90+0.093;

    b1 = 0.98*(cRate/2)^3.3+0.01741*(SoC/20);
    b2 = (-0.6045)/(SoC^2.4)-5.512e-4;
    b3 = SoC/20;
    b4 = 0.05*cRate^3-0.35*cRate^2+1;

    b = b1*b2*b3^b4;

    c = 26-a;

    d = 0.001e-6; % see lookup table

    % output
    capacity = a*exp(b*FCE)+c*exp(d*FCE);

    % plotting lines 
    FCE_CapRel   = line(FCE,capacity/0.26);
    
    set(FCE_CapRel                  , ...
        'Color'         , colormap(color,:) ,...
        'linewidth', 2);
        
    color = color+1;
    if color == 7
        color = 1;
    end
    
    legendHandles = [legendHandles FCE_CapRel];
end
    
    hXLabel = xlabel('FCE [cycles]' );
    hYLabel = ylabel('Capacity [%]'  );
    
    hLegend = legend(                 ...
      legendHandles                    , ...
      '0.06C', '0.24C'  , ...
      'location', 'Southwest'       );

    set( gca                        , ...
        'linewidth'  , 2            , ...
        'FontName'   , 'Helvetica'  , ...
        'FontSize'   , 16           );
    set([hXLabel, hYLabel]          , ...
        'FontSize'   , 22           );
    set(hLegend                     , ...
        'FontSize'   , 14           );

    set(gca, ...
      'Box'         , 'on'          , ...
      'TickDir'     , 'in'          , ...
      'TickLength'  , [.01 .01]     );
  
  %% plot resting SOC dependency
   
figure('Units', 'pixels'                , ...
       'Position', [150 150 800 600]    );
hold on;
colormap = [193, 48, 28; 201, 97, 18 ; 196, 167, 5 ; 23, 114, 69 ; 46, 87, 147 ; 75, 40, 130]./256;
color = 1;
legendHandles = gobjects(0);
    
% input
FCE = 20:20:2000;
cRate = 0.2;

for SoC = 95:-5:80

    % calculation
    a = 6.2*SoC/90+0.093;

    b1 = 0.98*(cRate/2)^3.3+0.01741*(SoC/20);
    b2 = (-0.6045)/(SoC^2.4)-5.512e-4;
    b3 = SoC/20;
    b4 = 0.05*cRate^3-0.35*cRate^2+1;

    b = b1*b2*b3^b4;

    c = 26-a;

    d = 0.001e-6; % see lookup table

    % output
    capacity = a*exp(b*FCE)+c*exp(d*FCE);

    % plotting lines 
    FCE_CapRel   = line(FCE,capacity/0.26);
    
    set(FCE_CapRel                  , ...
        'Color'         , colormap(color,:)  , ...
        'linewidth'  , 2        );
        
    color = color+1;
    if color == 7
        color = 1;
    end
    
    legendHandles = [legendHandles FCE_CapRel];
end
    
    hXLabel = xlabel('FCE [cycles]' );
    hYLabel = ylabel('Capacity [%]'  );
    
    hLegend = legend(                 ...
      legendHandles                    , ...
      '80%', '85%', '90%', '95%'  , ...
      'location', 'Southwest'       );

    set( gca                        , ...
        'linewidth'  , 2            , ...
        'FontName'   , 'Helvetica'  , ...
        'FontSize'   , 16           );
    set([hXLabel, hYLabel]          , ...
        'FontSize'   , 22           );
    set(hLegend                     , ...
        'FontSize'   , 14           );

    set(gca, ...
      'Box'         , 'on'          , ...
      'TickDir'     , 'in'          , ...
      'TickLength'  , [.01 .01]     );
  
   