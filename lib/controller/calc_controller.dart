import '../view/util.dart';

class CalculoController {
  setCCeCCD(context, fret, carg, eixo, List<double> values) {
    double cc = 0.0, ccd = 0.0;
    switch (fret) {
      case 'Lotação':
        switch (carg) {
          case 'Carga Geral':
            switch (eixo) {
              case '2':
                cc = 335.46;
                ccd = 3.2064;
                break;
              case '3':
                cc = 402.43;
                ccd = 4.1071;
                break;
              case '4':
                cc = 397.3;
                ccd = 4.5856;
                break;
              case '5':
                cc = 443.48;
                ccd = 5.2560;
                break;
              case '6':
                cc = 496.5;
                ccd = 5.9948;
                break;
              case '7':
                cc = 604.75;
                ccd = 6.6584;
                break;
              case '9':
                cc = 623.25;
                ccd = 7.74700;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Granel Sólido':
            switch (eixo) {
              case '2':
                cc = 338.1;
                ccd = 3.2160;
                break;
              case '3':
                cc = 407.26;
                ccd = 4.1247;
                break;
              case '4':
                cc = 399.71;
                ccd = 4.5944;
                break;
              case '5':
                cc = 444.20;
                ccd = 5.2586;
                break;
              case '6':
                cc = 497.22;
                ccd = 5.9974;
                break;
              case '7':
                cc = 604.51;
                ccd = 6.6575;
                break;
              case '9':
                cc = 625.65;
                ccd = 7.4788;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Granel Líquido':
            switch (eixo) {
              case '2':
                cc = 346.4;
                ccd = 3.2691;
                break;
              case '3':
                cc = 419.52;
                ccd = 4.1922;
                break;
              case '4':
                cc = 397.3;
                ccd = 4.6310;
                break;
              case '5':
                cc = 462.71;
                ccd = 5.3714;
                break;
              case '6':
                cc = 515.74;
                ccd = 6.1101;
                break;
              case '7':
                cc = 638.41;
                ccd = 6.8262;
                break;
              case '9':
                cc = 659.31;
                ccd = 7.6466;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Frigorificada':
            switch (eixo) {
              case '2':
                cc = 384;
                ccd = 3.8056;
                break;
              case '3':
                cc = 454.36;
                ccd = 4.8466;
                break;
              case '4':
                cc = 458.15;
                ccd = 5.4458;
                break;
              case '5':
                cc = 543.99;
                ccd = 6.3522;
                break;
              case '6':
                cc = 597.02;
                ccd = 7.1951;
                break;
              case '7':
                cc = 699.18;
                ccd = 7.8365;
                break;
              case '9':
                cc = 729.64;
                ccd = 8.8190;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Conteinerizada':
            switch (eixo) {
              case '2':
                erro(context, 'Tipo de Frete não disponível');
                break;
              case '3':
                cc = 402.43;
                ccd = 4.1071;
                break;
              case '4':
                cc = 397.3;
                ccd = 4.5856;
                break;
              case '5':
                cc = 443.48;
                ccd = 5.2560;
                break;
              case '6':
                cc = 496.5;
                ccd = 5.9948;
                break;
              case '7':
                cc = 604.75;
                ccd = 6.6584;
                break;
              case '9':
                cc = 623.25;
                ccd = 7.47;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Neogranel':
            switch (eixo) {
              case '2':
                cc = 335.46;
                ccd = 2.8668;
                break;
              case '3':
                cc = 402.43;
                ccd = 4.1071;
                break;
              case '4':
                cc = 404.03;
                ccd = 4.6101;
                break;
              case '5':
                cc = 443.48;
                ccd = 5.2560;
                break;
              case '6':
                cc = 496.5;
                ccd = 5.9948;
                break;
              case '7':
                cc = 604.75;
                ccd = 6.7584;
                break;
              case '9':
                cc = 623.25;
                ccd = 7.4700;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Perigosa (Granel Sólido)':
            switch (eixo) {
              case '2':
                cc = 458.23;
                ccd = 3.8463;
                break;
              case '3':
                cc = 527.39;
                ccd = 4.7549;
                break;
              case '4':
                cc = 522.28;
                ccd = 5.2461;
                break;
              case '5':
                cc = 566.78;
                ccd = 5.9103;
                break;
              case '6':
                cc = 619.8;
                ccd = 6.6491;
                break;
              case '7':
                cc = 731.34;
                ccd = 7.3246;
                break;
              case '9':
                cc = 754.84;
                ccd = 8.1545;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Perigosa (Granel Líquido)':
            switch (eixo) {
              case '2':
                cc = 477.05;
                ccd = 3.9147;
                break;
              case '3':
                cc = 550.17;
                ccd = 4.8378;
                break;
              case '4':
                cc = 530.4;
                ccd = 5.2756;
                break;
              case '5':
                cc = 595.81;
                ccd = 6.0159;
                break;
              case '6':
                cc = 648.84;
                ccd = 6.7547;
                break;
              case '7':
                cc = 775.76;
                ccd = 7.4862;
                break;
              case '9':
                cc = 799.02;
                ccd = 8.3151;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Perigosa (Carga Frigorificada)':
            switch (eixo) {
              case '2':
                cc = 470.75;
                ccd = 4.2961;
                break;
              case '3':
                cc = 541.11;
                ccd = 5.3372;
                break;
              case '4':
                cc = 548.09;
                ccd = 5.9426;
                break;
              case '5':
                cc = 633.93;
                ccd = 6.8489;
                break;
              case '6':
                cc = 686.96;
                ccd = 7.6919;
                break;
              case '7':
                cc = 794.64;
                ccd = 8.3534;
                break;
              case '9':
                cc = 828.17;
                ccd = 9.3470;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Perigosa (Containerizada)':
            switch (eixo) {
              case '2':
                erro(context, 'Tipo de Frete não disponível');
                break;
              case '3':
                cc = 479.96;
                ccd = 4.4019;
                break;
              case '4':
                cc = 477.28;
                ccd = 4.9018;
                break;
              case '5':
                cc = 523.46;
                ccd = 5.5722;
                break;
              case '6':
                cc = 576.48;
                ccd = 6.3110;
                break;
              case '7':
                cc = 688.98;
                ccd = 6.9900;
                break;
              case '9':
                cc = 709.84;
                ccd = 7.8103;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Perigosa (Carga Geral)':
            switch (eixo) {
              case '2':
                cc = 412.99;
                ccd = 3.5012;
                break;
              case '3':
                cc = 479.96;
                ccd = 4.4019;
                break;
              case '4':
                cc = 477.28;
                ccd = 4.9018;
                break;
              case '5':
                cc = 523.46;
                ccd = 5.5722;
                break;
              case '6':
                cc = 576.48;
                ccd = 6.3110;
                break;
              case '7':
                cc = 688.98;
                ccd = 6.9900;
                break;
              case '9':
                cc = 709.84;
                ccd = 7.8103;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Carga Granel Pressurizada':
            switch (eixo) {
              case '2':
                erro(context, 'Tipo de Frete não disponível');
                break;
              case '3':
                erro(context, 'Tipo de Frete não disponível');
                break;
              case '4':
                erro(context, 'Tipo de Frete não disponível');
                break;
              case '5':
                cc = 507.77;
                ccd = 5.4898;
                break;
              case '6':
                cc = 560.79;
                ccd = 6.2286;
                break;
              case '7':
                erro(context, 'Tipo de Frete não disponível');
                break;
              case '9':
                cc = 718.41;
                ccd = 7.8161;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          default:
            erro(context, 'Carga Inválida, tente novamente!');
            break;
        }
        break;
      case 'Somente Automotor':
        switch (carg) {
          case 'Carga Geral':
            switch (eixo) {
              case '2':
                erro(context, 'Tipo de Frete não disponível');
                break;
              case '3':
                erro(context, 'Tipo de Frete não disponível');
                break;
              case '4':
                cc = 361.24;
                ccd = 4.2193;
                break;
              case '5':
                cc = 397.8;
                ccd = 4.7372;
                break;
              case '6':
                cc = 450.82;
                ccd = 5.4760;
                break;
              case '7':
                cc = 537.43;
                ccd = 5.9433;
                break;
              case '9':
                cc = 531.89;
                ccd = 6.4323;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Granel Sólido':
            switch (eixo) {
              case '2':
                erro(context, 'Tipo de Frete não disponível');
                break;
              case '3':
                erro(context, 'Tipo de Frete não disponível');
                break;
              case '4':
                cc = 361.24;
                ccd = 4.2193;
                break;
              case '5':
                cc = 397.8;
                ccd = 4.7372;
                break;
              case '6':
                cc = 450.82;
                ccd = 5.4760;
                break;
              case '7':
                cc = 537.43;
                ccd = 5.9433;
                break;
              case '9':
                cc = 531.89;
                ccd = 6.4323;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Granel Líquido':
            switch (eixo) {
              case '2':
                erro(context, 'Tipo de Frete não disponível');
                break;
              case '3':
                erro(context, 'Tipo de Frete não disponível');
                break;
              case '4':
                cc = 361.24;
                ccd = 4.2647;
                break;
              case '5':
                cc = 397.8;
                ccd = 4.7826;
                break;
              case '6':
                cc = 450.82;
                ccd = 5.5214;
                break;
              case '7':
                cc = 537.43;
                ccd = 5.9887;
                break;
              case '9':
                cc = 531.89;
                ccd = 6.4777;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Frigorificada':
            switch (eixo) {
              case '2':
                erro(context, 'Tipo de Frete não disponível');
                break;
              case '3':
                erro(context, 'Tipo de Frete não disponível');
                break;
              case '4':
                cc = 394.43;
                ccd = 4.979;
                break;
              case '5':
                cc = 430.99;
                ccd = 5.5885;
                break;
              case '6':
                cc = 484.02;
                ccd = 6.4315;
                break;
              case '7':
                cc = 574.88;
                ccd = 6.9142;
                break;
              case '9':
                cc = 571.69;
                ccd = 7.5392;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Conteinerizada':
            switch (eixo) {
              case '2':
                erro(context, 'Tipo de Frete não disponível');
                break;
              case '3':
                erro(context, 'Tipo de Frete não disponível');
                break;
              case '4':
                cc = 361.24;
                ccd = 4.2193;
                break;
              case '5':
                cc = 397.8;
                ccd = 4.7372;
                break;
              case '6':
                cc = 450.82;
                ccd = 5.476;
                break;
              case '7':
                cc = 537.43;
                ccd = 5.9433;
                break;
              case '9':
                cc = 531.89;
                ccd = 6.4323;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Neogranel':
            switch (eixo) {
              case '2':
                erro(context, 'Tipo de Frete não disponível');
                break;
              case '3':
                erro(context, 'Tipo de Frete não disponível');
                break;
              case '4':
                cc = 361.24;
                ccd = 4.2193;
                break;
              case '5':
                cc = 397.8;
                ccd = 4.7372;
                break;
              case '6':
                cc = 450.82;
                ccd = 5.476;
                break;
              case '7':
                cc = 537.43;
                ccd = 5.9433;
                break;
              case '9':
                cc = 531.89;
                ccd = 6.4323;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Perigosa (Granel Sólido)':
            switch (eixo) {
              case '2':
                erro(context, 'Tipo de Frete não disponível');
                break;
              case '3':
                erro(context, 'Tipo de Frete não disponível');
                break;
              case '4':
                cc = 483.82;
                ccd = 4.871;
                break;
              case '5':
                cc = 520.37;
                ccd = 5.3889;
                break;
              case '6':
                cc = 573.4;
                ccd = 6.1277;
                break;
              case '7':
                cc = 664.26;
                ccd = 6.6104;
                break;
              case '9':
                cc = 661.07;
                ccd = 7.1081;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Perigosa (Granel Líquido)':
            switch (eixo) {
              case '2':
                erro(context, 'Tipo de Frete não disponível');
                break;
              case '3':
                erro(context, 'Tipo de Frete não disponível');
                break;
              case '4':
                cc = 494.34;
                ccd = 4.9083;
                break;
              case '5':
                cc = 530.9;
                ccd = 5.4271;
                break;
              case '6':
                cc = 583.92;
                ccd = 6.1659;
                break;
              case '7':
                cc = 674.78;
                ccd = 6.6487;
                break;
              case '9':
                cc = 671.59;
                ccd = 7.1463;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Perigosa (Carga Frigorificada)':
            switch (eixo) {
              case '2':
                erro(context, 'Tipo de Frete não disponível');
                break;
              case '3':
                erro(context, 'Tipo de Frete não disponível');
                break;
              case '4':
                cc = 484.37;
                ccd = 5.4757;
                break;
              case '5':
                cc = 520.93;
                ccd = 6.0853;
                break;
              case '6':
                cc = 573.96;
                ccd = 6.9283;
                break;
              case '7':
                cc = 670.34;
                ccd = 7.4311;
                break;
              case '9':
                cc = 670.22;
                ccd = 8.0672;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Perigosa (Containerizada)':
            switch (eixo) {
              case '2':
                erro(context, 'Tipo de Frete não disponível');
                break;
              case '3':
                erro(context, 'Tipo de Frete não disponível');
                break;
              case '4':
                cc = 441.22;
                ccd = 4.5355;
                break;
              case '5':
                cc = 477.78;
                ccd = 5.0534;
                break;
              case '6':
                cc = 530.8;
                ccd = 5.7922;
                break;
              case '7':
                cc = 621.66;
                ccd = 6.2749;
                break;
              case '9':
                cc = 618.47;
                ccd = 6.7726;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Perigosa (Carga Geral)':
            switch (eixo) {
              case '2':
                erro(context, 'Tipo de Frete não disponível');
                break;
              case '3':
                erro(context, 'Tipo de Frete não disponível');
                break;
              case '4':
                cc = 441.22;
                ccd = 4.5355;
                break;
              case '5':
                cc = 477.78;
                ccd = 5.0534;
                break;
              case '6':
                cc = 530.8;
                ccd = 5.7922;
                break;
              case '7':
                cc = 621.66;
                ccd = 6.2749;
                break;
              case '9':
                cc = 618.47;
                ccd = 6.7726;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Carga Granel Pressurizada':
            switch (eixo) {
              case '2':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '3':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '4':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '5':
                cc = 397.8;
                ccd = 4.7372;
                break;
              case '6':
                cc = 450.82;
                ccd = 5.476;
                break;
              case '7':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '9':
                cc = 531.89;
                ccd = 6.4323;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          default:
            erro(context, 'Carga Inválida, tente novamente!');
            break;
        }
        break;
      case 'Lotação - Alto Desempenho':
        switch (carg) {
          case 'Carga Geral':
            switch (eixo) {
              case '2':
                cc = 139.03;
                ccd = 2.8292;
                break;
              case '3':
                cc = 153.46;
                ccd = 3.5738;
                break;
              case '4':
                cc = 155.87;
                ccd = 4.0856;
                break;
              case '5':
                cc = 165.82;
                ccd = 4.6484;
                break;
              case '6':
                cc = 177.25;
                ccd = 5.2636;
                break;
              case '7':
                cc = 206.68;
                ccd = 5.7119;
                break;
              case '9':
                cc = 214.05;
                ccd = 6.5009;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Granel Sólido':
            switch (eixo) {
              case '2':
                cc = 139.6;
                ccd = 2.8326;
                break;
              case '3':
                cc = 154.5;
                ccd = 3.5801;
                break;
              case '4':
                cc = 156.39;
                ccd = 4.0887;
                break;
              case '5':
                cc = 165.98;
                ccd = 4.6493;
                break;
              case '6':
                cc = 177.4;
                ccd = 5.2645;
                break;
              case '7':
                cc = 206.63;
                ccd = 5.7116;
                break;
              case '9':
                cc = 214.57;
                ccd = 6.5041;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Granel Líquido':
            switch (eixo) {
              case '2':
                cc = 141.38;
                ccd = 2.8664;
                break;
              case '3':
                cc = 157.14;
                ccd = 3.6190;
                break;
              case '4':
                cc = 155.87;
                ccd = 4.1310;
                break;
              case '5':
                cc = 169.97;
                ccd = 4.7189;
                break;
              case '6':
                cc = 181.39;
                ccd = 5.3341;
                break;
              case '7':
                cc = 213.93;
                ccd = 5.8012;
                break;
              case '9':
                cc = 221.82;
                ccd = 6.5934;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Frigorificada':
            switch (eixo) {
              case '2':
                cc = 162.74;
                ccd = 3.3955;
                break;
              case '3':
                cc = 177.9;
                ccd = 4.2726;
                break;
              case '4':
                cc = 183.29;
                ccd = 4.8907;
                break;
              case '5':
                cc = 201.79;
                ccd = 5.5970;
                break;
              case '6':
                cc = 213.21;
                ccd = 6.3163;
                break;
              case '7':
                cc = 243.16;
                ccd = 6.7678;
                break;
              case '9':
                cc = 254.13;
                ccd = 7.7060;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Conteinerizada':
            switch (eixo) {
              case '2':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '3':
                cc = 153.46;
                ccd = 3.5738;
                break;
              case '4':
                cc = 155.87;
                ccd = 4.0856;
                break;
              case '5':
                cc = 165.82;
                ccd = 4.6484;
                break;
              case '6':
                cc = 177.25;
                ccd = 5.2636;
                break;
              case '7':
                cc = 206.68;
                ccd = 5.7119;
                break;
              case '9':
                cc = 214.05;
                ccd = 6.5009;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Neogranel':
            switch (eixo) {
              case '2':
                cc = 139.03;
                ccd = 2.4895;
                break;
              case '3':
                cc = 153.46;
                ccd = 5.5738;
                break;
              case '4':
                cc = 157.32;
                ccd = 4.0944;
                break;
              case '5':
                cc = 165.82;
                ccd = 4.6484;
                break;
              case '6':
                cc = 177.25;
                ccd = 5.2636;
                break;
              case '7':
                cc = 206.68;
                ccd = 5.7119;
                break;
              case '9':
                cc = 214.05;
                ccd = 6.5009;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Perigosa (Granel Sólido)':
            switch (eixo) {
              case '2':
                cc = 178.73;
                ccd = 3.2632;
                break;
              case '3':
                cc = 193.63;
                ccd = 4.0107;
                break;
              case '4':
                cc = 197.11;
                ccd = 4.5414;
                break;
              case '5':
                cc = 206.7;
                ccd = 5.1020;
                break;
              case '6':
                cc = 218.12;
                ccd = 5.7172;
                break;
              case '7':
                cc = 250.09;
                ccd = 6.1809;
                break;
              case '9':
                cc = 259.56;
                ccd = 6.9827;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Perigosa (Granel Líquido)':
            switch (eixo) {
              case '2':
                cc = 182.89;
                ccd = 3.2878;
                break;
              case '3':
                cc = 198.54;
                ccd = 4.0404;
                break;
              case '4':
                cc = 198.86;
                ccd = 4.5520;
                break;
              case '5':
                cc = 212.95;
                ccd = 5.1399;
                break;
              case '6':
                cc = 224.38;
                ccd = 5.7552;
                break;
              case '7':
                cc = 259.67;
                ccd = 6.2390;
                break;
              case '9':
                cc = 269.08;
                ccd = 7.0404;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Perigosa (Carga Frigorificada)':
            switch (eixo) {
              case '2':
                cc = 198.65;
                ccd = 3.7883;
                break;
              case '3':
                cc = 213.82;
                ccd = 4.6654;
                break;
              case '4':
                cc = 221.27;
                ccd = 5.2905;
                break;
              case '5':
                cc = 239.76;
                ccd = 5.9968;
                break;
              case '6':
                cc = 251.19;
                ccd = 6.7162;
                break;
              case '7':
                cc = 284.71;
                ccd = 7.1893;
                break;
              case '9':
                cc = 297.66;
                ccd = 8.1395;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Perigosa (Containerizada)':
            switch (eixo) {
              case '2':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '3':
                cc = 183.41;
                ccd = 3.7682;
                break;
              case '4':
                cc = 187.41;
                ccd = 4.3021;
                break;
              case '5':
                cc = 197.36;
                ccd = 4.8649;
                break;
              case '6':
                cc = 208.79;
                ccd = 5.4801;
                break;
              case '7':
                cc = 240.97;
                ccd = 5.9451;
                break;
              case '9':
                cc = 249.86;
                ccd = 6.7433;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Perigosa (Carga Geral)':
            switch (eixo) {
              case '2':
                cc = 168.98;
                ccd = 3.0235;
                break;
              case '3':
                cc = 183.41;
                ccd = 3.7682;
                break;
              case '4':
                cc = 187.41;
                ccd = 4.3021;
                break;
              case '5':
                cc = 197.36;
                ccd = 4.8649;
                break;
              case '6':
                cc = 208.79;
                ccd = 5.4801;
                break;
              case '7':
                cc = 240.97;
                ccd = 5.9451;
                break;
              case '9':
                cc = 249.86;
                ccd = 6.7433;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Carga Granel Pressurizada':
            switch (eixo) {
              case '2':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '3':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '4':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '5':
                cc = 179.67;
                ccd = 4.7323;
                break;
              case '6':
                cc = 191.1;
                ccd = 5.3475;
                break;
              case '7':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '9':
                cc = 234.56;
                ccd = 6.6252;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          default:
            erro(context, 'Carga Inválida, tente novamente!');
            break;
        }
        break;
      case 'Somente Automotor - Alto Desempenho':
        switch (carg) {
          case 'Carga Geral':
            switch (eixo) {
              case '2':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '3':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '4':
                cc = 148.1;
                ccd = 3.7642;
                break;
              case '5':
                cc = 155.98;
                ccd = 4.1968;
                break;
              case '6':
                cc = 167.4;
                ccd = 4.8121;
                break;
              case '7':
                cc = 192.17;
                ccd = 5.0885;
                break;
              case '9':
                cc = 194.36;
                ccd = 5.611;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Granel Sólido':
            switch (eixo) {
              case '2':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '3':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '4':
                cc = 148.1;
                ccd = 3.7642;
                break;
              case '5':
                cc = 155.98;
                ccd = 4.1968;
                break;
              case '6':
                cc = 167.4;
                ccd = 4.8121;
                break;
              case '7':
                cc = 192.17;
                ccd = 5.0885;
                break;
              case '9':
                cc = 194.36;
                ccd = 5.611;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Granel Líquido':
            switch (eixo) {
              case '2':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '3':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '4':
                cc = 148.1;
                ccd = 3.8096;
                break;
              case '5':
                cc = 155.98;
                ccd = 4.2422;
                break;
              case '6':
                cc = 167.4;
                ccd = 4.8574;
                break;
              case '7':
                cc = 192.17;
                ccd = 5.1339;
                break;
              case '9':
                cc = 194.36;
                ccd = 5.6564;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Frigorificada':
            switch (eixo) {
              case '2':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '3':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '4':
                cc = 169.56;
                ccd = 4.5332;
                break;
              case '5':
                cc = 177.44;
                ccd = 5.0575;
                break;
              case '6':
                cc = 188.86;
                ccd = 5.7769;
                break;
              case '7':
                cc = 216.38;
                ccd = 6.0700;
                break;
              case '9':
                cc = 220.09;
                ccd = 6.7291;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Conteinerizada':
            switch (eixo) {
              case '2':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '3':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '4':
                cc = 148.1;
                ccd = 3.7642;
                break;
              case '5':
                cc = 155.98;
                ccd = 4.1968;
                break;
              case '6':
                cc = 167.4;
                ccd = 4.8121;
                break;
              case '7':
                cc = 192.17;
                ccd = 5.0885;
                break;
              case '9':
                cc = 194.36;
                ccd = 5.611;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Neogranel':
            switch (eixo) {
              case '2':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '3':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '4':
                cc = 148.1;
                ccd = 3.7642;
                break;
              case '5':
                cc = 155.98;
                ccd = 4.1968;
                break;
              case '6':
                cc = 167.4;
                ccd = 4.8121;
                break;
              case '7':
                cc = 192.17;
                ccd = 5.0885;
                break;
              case '9':
                cc = 194.36;
                ccd = 5.611;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Perigosa (Granel Sólido)':
            switch (eixo) {
              case '2':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '3':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '4':
                cc = 188.82;
                ccd = 4.2169;
                break;
              case '5':
                cc = 196.7;
                ccd = 4.6496;
                break;
              case '6':
                cc = 208.12;
                ccd = 5.2648;
                break;
              case '7':
                cc = 235.64;
                ccd = 5.5579;
                break;
              case '9':
                cc = 239.35;
                ccd = 6.0896;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Perigosa (Granel Líquido)':
            switch (eixo) {
              case '2':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '3':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '4':
                cc = 191.09;
                ccd = 4.2307;
                break;
              case '5':
                cc = 198.96;
                ccd = 4.6633;
                break;
              case '6':
                cc = 210.39;
                ccd = 5.2785;
                break;
              case '7':
                cc = 237.91;
                ccd = 5.5716;
                break;
              case '9':
                cc = 241.62;
                ccd = 6.1034;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Perigosa (Carga Frigorificada)':
            switch (eixo) {
              case '2':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '3':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '4':
                cc = 207.54;
                ccd = 4.933;
                break;
              case '5':
                cc = 215.42;
                ccd = 5.4574;
                break;
              case '6':
                cc = 226.84;
                ccd = 6.1768;
                break;
              case '7':
                cc = 257.93;
                ccd = 6.4915;
                break;
              case '9':
                cc = 263.63;
                ccd = 7.1626;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Perigosa (Containerizada)':
            switch (eixo) {
              case '2':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '3':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '4':
                cc = 179.64;
                ccd = 3.9807;
                break;
              case '5':
                cc = 187.52;
                ccd = 4.4134;
                break;
              case '6':
                cc = 198.94;
                ccd = 5.0286;
                break;
              case '7':
                cc = 226.46;
                ccd = 5.3217;
                break;
              case '9':
                cc = 230.18;
                ccd = 5.8534;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Perigosa (Carga Geral)':
            switch (eixo) {
              case '2':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '3':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '4':
                cc = 179.64;
                ccd = 3.9807;
                break;
              case '5':
                cc = 187.52;
                ccd = 4.4134;
                break;
              case '6':
                cc = 198.94;
                ccd = 5.0286;
                break;
              case '7':
                cc = 226.46;
                ccd = 5.3217;
                break;
              case '9':
                cc = 230.18;
                ccd = 5.8534;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          case 'Carga Granel Pressurizada':
            switch (eixo) {
              case '2':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '3':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '4':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '5':
                cc = 155.98;
                ccd = 4.1968;
                break;
              case '6':
                cc = 167.4;
                ccd = 4.8121;
                break;
              case '7':
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
              case '9':
                cc = 194.36;
                ccd = 5.6110;
                break;
              default:
                erro(context, 'Numero de Eixos Inválido, tente novamente!');
                break;
            }
            break;
          default:
            erro(context, 'Carga Inválida, tente novamente!');
            break;
        }
        break;
      default:
        erro(context, 'Frete Inválido, tente novamente!');
        break;
    }
    values[0] = cc;
    values[1] = ccd;
  }
}
