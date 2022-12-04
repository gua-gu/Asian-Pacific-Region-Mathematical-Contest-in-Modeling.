A=[1,7,5,1;
    1/7,1,1/3,1/7;
    1/5,3,1,1/5;
    1,7,5,1];%树木生态水源空气 权重设置

B = [1,2,5,7;
    1/2,1,4,6;
    1/5,1/4,1,3;
    1/7,1/6,1/3,1];%湿地林地草地荒地 权重设置

C = [1,3,5,5;
    1/3,1,3,3;
    1/5,1/3,1,3;
    1/5,1/3,1/3,1];%有林疏林灌木未成 权重设置
%AHP是层次分析法：https://zhuanlan.zhihu.com/p/118594058

[WA, LmaxA, CIA, CRA] = AHP(A);
[WB, LmaxB, CIB, CRB] = AHP(B);
[WC, LmaxC, CIC, CRC] = AHP(C);

%62年是1，12年做比较
Cyoulin=[1,5.4;
        1/5.4,1];
Cshulin=[1,0.0815;
        1/0.0815,1];
Cguanlin=[1,1097.48;
         1/1097.48,1];
Cweicheng=[1,1.63;
            1/1.63,1];
        
[WCyoulin, LmaxCyoulin, CICyoulin, CRCyoulin] = AHP(Cyoulin);
[WCshulin, LmaxCshulin, CICshulin, CRCshulin] = AHP(Cshulin);
[WCguanlin, LmaxCguanlin, CICguanlin, CRCguanlin] = AHP(Cguanlin);
[WCweicheng, LmaxCweicheng, CICweicheng, CRCweicheng] = AHP(Cweicheng);

rlts3C =[WCyoulin,WCshulin,WCguanlin,WCweicheng];
C12_62 = rlts3C*WC;

Bshidi=[1,45.42;
    1/45.42,1];
Bcaodi=[1,0.376;
    1/0.376,1];
Bhuangdi=[1,0.092;
    1/0.092,1];

[WBshidi, LmaxBshidi, CIBshidi, CRBshidi] = AHP(Bshidi);
[WBcaodi, LmaxBcaodi, CIBcaodi, CRBcaodi] = AHP(Bcaodi);
[WBhuangdi, LmaxBhuangdi, CIBhuangdi, CRBhuangdi] = AHP(Bhuangdi);

rlts3B =[WBshidi,C12_62,WBcaodi,WBhuangdi];
B12_62 = rlts3B*WB;

Ashengtai = [1,1897;
            1/1897,1];
Ashuiyuan = [1,1.07/0.09;
            0.09/1.07,1];
Akongqi = [1,77.6/2.74;
            2.74/77.6,1];

[WAshengtai, LmaxAshengtai, CIAshengtai, CRAshengtai] = AHP(Ashengtai);
[WAshuiyuan, LmaxAshuiyuan, CIAshuiyuan, CRAshuiyuan] = AHP(Ashuiyuan);
[WAkongqi, LmaxAkongqi, CIAkongqi, CRAkongqi] = AHP(Akongqi);

rlts3A =[B12_62,WAshengtai,WAshuiyuan,WAkongqi];
A12_62 = rlts3A*WA;
