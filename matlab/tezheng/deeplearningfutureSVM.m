close all;
clear all;
clc;

%%%%%%%%%%%%%特征参数作图%%%%%%%%%%%%%%%%%%%%
fc=7e7;%载波频率
fs=2e8;%采样频率
fd=2e6;%码速率
freqsep=1e6;%频偏
df=25e5;%频率分辨率
dalpha=0.25e5;%循环频率分辨率
Ac=1;%振幅
Nt=4000;%独立仿真次数
train_Nt=200*10;
test_Nt=Nt-train_Nt;
N_code=1000;%码元个数
N_mode=10;%信号数
N_snr=1;

fe1=zeros(N_mode,N_snr,Nt); fe2=zeros(N_mode,N_snr,Nt); fe3=zeros(N_mode,N_snr,Nt);
fe4=zeros(N_mode,N_snr,Nt); fe5=zeros(N_mode,N_snr,Nt); fe6=zeros(N_mode,N_snr,Nt); 
fe7=zeros(N_mode,N_snr,Nt); fe8=zeros(N_mode,N_snr,Nt); fe9=zeros(N_mode,N_snr,Nt);
%%细节能量值特征 E1-E5（小波）
for nt=1:Nt;
    for snr=0:N_snr-1
        for type=1:N_mode
            switch type
                case 1
                    y=ask2(N_code,fc,fs,fd,Ac);                
                    yr=awgn(y,snr,'measured','db');
                    [E1,E2,E3,E4,E5]=featurexb_extraction(yr);
                    fe1(type,snr+1,nt)=E1;fe2(type,snr+1,nt)=E2;fe3(type,snr+1,nt)=E3;
                    fe4(type,snr+1,nt)=E4;fe5(type,snr+1,nt)=E5;
                case 2
                    y=ask4(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [E1,E2,E3,E4,E5]=featurexb_extraction(yr);
                    fe1(type,snr+1,nt)=E1;fe2(type,snr+1,nt)=E2;fe3(type,snr+1,nt)=E3;
                    fe4(type,snr+1,nt)=E4;fe5(type,snr+1,nt)=E5;
                case 3
                    y=ask8(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [E1,E2,E3,E4,E5]=featurexb_extraction(yr);
                    fe1(type,snr+1,nt)=E1;fe2(type,snr+1,nt)=E2;fe3(type,snr+1,nt)=E3;
                    fe4(type,snr+1,nt)=E4;fe5(type,snr+1,nt)=E5;
                case 4
                    y=fsk2(N_code,fc,fs,fd,freqsep,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [E1,E2,E3,E4,E5]=featurexb_extraction(yr);
                    fe1(type,snr+1,nt)=E1;fe2(type,snr+1,nt)=E2;fe3(type,snr+1,nt)=E3;
                    fe4(type,snr+1,nt)=E4;fe5(type,snr+1,nt)=E5;
                case 5
                    y=fsk4(N_code,fc,fs,fd,freqsep,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [E1,E2,E3,E4,E5]=featurexb_extraction(yr);
                    fe1(type,snr+1,nt)=E1;fe2(type,snr+1,nt)=E2;fe3(type,snr+1,nt)=E3;
                    fe4(type,snr+1,nt)=E4;fe5(type,snr+1,nt)=E5;
                case 6
                    y=fsk8(N_code,fc,fs,fd,freqsep,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [E1,E2,E3,E4,E5]=featurexb_extraction(yr);
                    fe1(type,snr+1,nt)=E1;fe2(type,snr+1,nt)=E2;fe3(type,snr+1,nt)=E3;
                    fe4(type,snr+1,nt)=E4;fe5(type,snr+1,nt)=E5;
                case 7
                    y=psk2(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [E1,E2,E3,E4,E5]=featurexb_extraction(yr);
                    fe1(type,snr+1,nt)=E1;fe2(type,snr+1,nt)=E2;fe3(type,snr+1,nt)=E3;
                    fe4(type,snr+1,nt)=E4;fe5(type,snr+1,nt)=E5;
                case 8
                    y=psk4(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [E1,E2,E3,E4,E5]=featurexb_extraction(yr);
                    fe1(type,snr+1,nt)=E1;fe2(type,snr+1,nt)=E2;fe3(type,snr+1,nt)=E3;
                    fe4(type,snr+1,nt)=E4;fe5(type,snr+1,nt)=E5;
                case 9
                    y=psk8(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [E1,E2,E3,E4,E5]=featurexb_extraction(yr);
                    fe1(type,snr+1,nt)=E1;fe2(type,snr+1,nt)=E2;fe3(type,snr+1,nt)=E3;
                    fe4(type,snr+1,nt)=E4;fe5(type,snr+1,nt)=E5;
                case 10
                    y=qam16(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [E1,E2,E3,E4,E5]=featurexb_extraction(yr);
                    fe1(type,snr+1,nt)=E1;fe2(type,snr+1,nt)=E2;fe3(type,snr+1,nt)=E3;
                    fe4(type,snr+1,nt)=E4;fe5(type,snr+1,nt)=E5;
            end
        end
    end
end

save xbfe fe1 fe2 fe3 fe4 fe5;

mean_fe1=mean(fe1,3);mean_fe2=mean(fe2,3);mean_fe3=mean(fe3,3);
mean_fe4=mean(fe4,3);mean_fe5=mean(fe5,3);mean_fe6=mean(fe6,3);
mean_fe7=mean(fe7,3);mean_fe8=mean(fe8,3);mean_fe9=mean(fe9,3);

save xbmean mean_fe1 mean_fe2 mean_fe3 mean_fe4 mean_fe5;

%特征矩阵生成har
fe_temp1=[fe1;fe2;fe3;fe4;fe5];
fe_temp1=reshape(fe_temp1,10,5,Nt);
fe_har=zeros(Nt*N_mode,5);
for num_nt=1:Nt
   fe_har(10*(num_nt-1)+1:num_nt*10,:)=fe_temp1(:,:,num_nt);
end
%瞬时特性
%r_max ：gamma_max零中心归一化瞬时幅度功率谱密度的最大值
%E：幅度包络的标准差  sigma_aa归一化中心瞬时幅度绝对值的标准偏差   sigma_ap：瞬时相位的中心非线性分量的绝对值的标准偏差
%sigma_dp：瞬时相位直接值的中心非线性分量的标准偏差 sigma_af：归一化中心瞬时频率的绝对值的标准偏差  Pmax：归一化功率谱的最大值
%d1到d7位高阶累计量

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fea1=zeros(N_mode,N_snr,Nt); fea2=zeros(N_mode,N_snr,Nt); fea3=zeros(N_mode,N_snr,Nt);
fea4=zeros(N_mode,N_snr,Nt); fea5=zeros(N_mode,N_snr,Nt); fea6=zeros(N_mode,N_snr,Nt); 
fea7=zeros(N_mode,N_snr,Nt); fea8=zeros(N_mode,N_snr,Nt); fea9=zeros(N_mode,N_snr,Nt);
fea10=zeros(N_mode,N_snr,Nt);fea11=zeros(N_mode,N_snr,Nt);fea12=zeros(N_mode,N_snr,Nt);
fea13=zeros(N_mode,N_snr,Nt);fea14=zeros(N_mode,N_snr,Nt);fea15=zeros(N_mode,N_snr,Nt);

for nt=1:Nt;
    for snr=0:N_snr-1
        for type=1:N_mode
            switch type
                case 1
                    y=ask2(N_code,fc,fs,fd,Ac);                
                    yr=awgn(y,snr,'measured','db');
                    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
                    fea1(type,snr+1,nt)=r_max;fea2(type,snr+1,nt)=E;fea3(type,snr+1,nt)=m_A;fea4(type,snr+1,nt)=sigma_aa;
                    fea5(type,snr+1,nt)=sigma_ap;fea6(type,snr+1,nt)=sigma_dp;fea7(type,snr+1,nt)=sigma_af;fea8(type,snr+1,nt)=P_max;
                    fea9(type,snr+1,nt)=d_1;fea10(type,snr+1,nt)=d_2;fea11(type,snr+1,nt)=d_3;fea12(type,snr+1,nt)=d_4;
                    fea13(type,snr+1,nt)=d_5;fea14(type,snr+1,nt)=d_6;fea15(type,snr+1,nt)=d_7;
                case 2
                    y=ask4(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
                    fea1(type,snr+1,nt)=r_max;fea2(type,snr+1,nt)=E;fea3(type,snr+1,nt)=m_A;fea4(type,snr+1,nt)=sigma_aa;
                    fea5(type,snr+1,nt)=sigma_ap;fea6(type,snr+1,nt)=sigma_dp;fea7(type,snr+1,nt)=sigma_af;fea8(type,snr+1,nt)=P_max;
                    fea9(type,snr+1,nt)=d_1;fea10(type,snr+1,nt)=d_2;fea11(type,snr+1,nt)=d_3;fea12(type,snr+1,nt)=d_4;
                    fea13(type,snr+1,nt)=d_5;fea14(type,snr+1,nt)=d_6;fea15(type,snr+1,nt)=d_7;
                case 3
                    y=ask8(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
                    fea1(type,snr+1,nt)=r_max;fea2(type,snr+1,nt)=E;fea3(type,snr+1,nt)=m_A;fea4(type,snr+1,nt)=sigma_aa;
                    fea5(type,snr+1,nt)=sigma_ap;fea6(type,snr+1,nt)=sigma_dp;fea7(type,snr+1,nt)=sigma_af;fea8(type,snr+1,nt)=P_max;
                    fea9(type,snr+1,nt)=d_1;fea10(type,snr+1,nt)=d_2;fea11(type,snr+1,nt)=d_3;fea12(type,snr+1,nt)=d_4;
                    fea13(type,snr+1,nt)=d_5;fea14(type,snr+1,nt)=d_6;fea15(type,snr+1,nt)=d_7;
                case 4
                    y=fsk2(N_code,fc,fs,fd,freqsep,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
                    fea1(type,snr+1,nt)=r_max;fea2(type,snr+1,nt)=E;fea3(type,snr+1,nt)=m_A;fea4(type,snr+1,nt)=sigma_aa;
                    fea5(type,snr+1,nt)=sigma_ap;fea6(type,snr+1,nt)=sigma_dp;fea7(type,snr+1,nt)=sigma_af;fea8(type,snr+1,nt)=P_max;
                    fea9(type,snr+1,nt)=d_1;fea10(type,snr+1,nt)=d_2;fea11(type,snr+1,nt)=d_3;fea12(type,snr+1,nt)=d_4;
                    fea13(type,snr+1,nt)=d_5;fea14(type,snr+1,nt)=d_6;fea15(type,snr+1,nt)=d_7;
                case 5
                    y=fsk4(N_code,fc,fs,fd,freqsep,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
                    fea1(type,snr+1,nt)=r_max;fea2(type,snr+1,nt)=E;fea3(type,snr+1,nt)=m_A;fea4(type,snr+1,nt)=sigma_aa;
                    fea5(type,snr+1,nt)=sigma_ap;fea6(type,snr+1,nt)=sigma_dp;fea7(type,snr+1,nt)=sigma_af;fea8(type,snr+1,nt)=P_max;
                    fea9(type,snr+1,nt)=d_1;fea10(type,snr+1,nt)=d_2;fea11(type,snr+1,nt)=d_3;fea12(type,snr+1,nt)=d_4;
                    fea13(type,snr+1,nt)=d_5;fea14(type,snr+1,nt)=d_6;fea15(type,snr+1,nt)=d_7;
                case 6
                    y=fsk8(N_code,fc,fs,fd,freqsep,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
                    fea1(type,snr+1,nt)=r_max;fea2(type,snr+1,nt)=E;fea3(type,snr+1,nt)=m_A;fea4(type,snr+1,nt)=sigma_aa;
                    fea5(type,snr+1,nt)=sigma_ap;fea6(type,snr+1,nt)=sigma_dp;fea7(type,snr+1,nt)=sigma_af;fea8(type,snr+1,nt)=P_max;
                    fea9(type,snr+1,nt)=d_1;fea10(type,snr+1,nt)=d_2;fea11(type,snr+1,nt)=d_3;fea12(type,snr+1,nt)=d_4;
                    fea13(type,snr+1,nt)=d_5;fea14(type,snr+1,nt)=d_6;fea15(type,snr+1,nt)=d_7;
                case 7
                    y=psk2(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
                    fea1(type,snr+1,nt)=r_max;fea2(type,snr+1,nt)=E;fea3(type,snr+1,nt)=m_A;fea4(type,snr+1,nt)=sigma_aa;
                    fea5(type,snr+1,nt)=sigma_ap;fea6(type,snr+1,nt)=sigma_dp;fea7(type,snr+1,nt)=sigma_af;fea8(type,snr+1,nt)=P_max;
                    fea9(type,snr+1,nt)=d_1;fea10(type,snr+1,nt)=d_2;fea11(type,snr+1,nt)=d_3;fea12(type,snr+1,nt)=d_4;
                    fea13(type,snr+1,nt)=d_5;fea14(type,snr+1,nt)=d_6;fea15(type,snr+1,nt)=d_7;
                case 8
                    y=psk4(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
                    fea1(type,snr+1,nt)=r_max;fea2(type,snr+1,nt)=E;fea3(type,snr+1,nt)=m_A;fea4(type,snr+1,nt)=sigma_aa;
                    fea5(type,snr+1,nt)=sigma_ap;fea6(type,snr+1,nt)=sigma_dp;fea7(type,snr+1,nt)=sigma_af;fea8(type,snr+1,nt)=P_max;
                    fea9(type,snr+1,nt)=d_1;fea10(type,snr+1,nt)=d_2;fea11(type,snr+1,nt)=d_3;fea12(type,snr+1,nt)=d_4;
                    fea13(type,snr+1,nt)=d_5;fea14(type,snr+1,nt)=d_6;fea15(type,snr+1,nt)=d_7;
                case 9
                    y=psk8(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
                    fea1(type,snr+1,nt)=r_max;fea2(type,snr+1,nt)=E;fea3(type,snr+1,nt)=m_A;fea4(type,snr+1,nt)=sigma_aa;
                    fea5(type,snr+1,nt)=sigma_ap;fea6(type,snr+1,nt)=sigma_dp;fea7(type,snr+1,nt)=sigma_af;fea8(type,snr+1,nt)=P_max;
                    fea9(type,snr+1,nt)=d_1;fea10(type,snr+1,nt)=d_2;fea11(type,snr+1,nt)=d_3;fea12(type,snr+1,nt)=d_4;
                    fea13(type,snr+1,nt)=d_5;fea14(type,snr+1,nt)=d_6;fea15(type,snr+1,nt)=d_7;
                case 10
                    y=qam16(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
                    fea1(type,snr+1,nt)=r_max;fea2(type,snr+1,nt)=E;fea3(type,snr+1,nt)=m_A;fea4(type,snr+1,nt)=sigma_aa;
                    fea5(type,snr+1,nt)=sigma_ap;fea6(type,snr+1,nt)=sigma_dp;fea7(type,snr+1,nt)=sigma_af;fea8(type,snr+1,nt)=P_max;
                    fea9(type,snr+1,nt)=d_1;fea10(type,snr+1,nt)=d_2;fea11(type,snr+1,nt)=d_3;fea12(type,snr+1,nt)=d_4;
                    fea13(type,snr+1,nt)=d_5;fea14(type,snr+1,nt)=d_6;fea15(type,snr+1,nt)=d_7;
            end
        end
    end
end

save ssgjfe fea1 fea2 fea3 fea4 fea5 fea6 fea7 fea8 fea9 fea10 fea11 fea12 fea13 fea14 fea15;

mean_fea1=mean(fea1,3);mean_fea2=mean(fea2,3);mean_fea3=mean(fea3,3);
mean_fea4=mean(fea4,3);mean_fea5=mean(fea5,3);mean_fea6=mean(fea6,3);
mean_fea7=mean(fea7,3);mean_fea8=mean(fea8,3);mean_fea9=mean(fea9,3);
mean_fea10=mean(fea10,3);mean_fea11=mean(fea11,3);mean_fea12=mean(fea12,3);
mean_fea13=mean(fea13,3);mean_fea14=mean(fea14,3);mean_fea15=mean(fea15,3);

save ssgjmean mean_fea1 mean_fea2 mean_fea3 mean_fea4 mean_fea5 mean_fea6 mean_fea7 mean_fea8 mean_fea9 mean_fea10 mean_fea11 mean_fea12 mean_fea13 mean_fea14 mean_fea15;

%fe_ss=[mean_fea1;mean_fea2;mean_fea3;mean_fea4;mean_fea5;mean_fea6;mean_fea7;mean_fea8;mean_fea9;mean_fea10;mean_fea11;mean_fea12;mean_fea13;mean_fea14;mean_fea15];
%fe_ss=reshape(fe_ss,10,15);

%生成特征
fe_temp2=[fea1;fea2;fea3;fea4;fea5;fea6;fea7;fea8;fea9;fea10;fea11;fea12;fea13;fea14;fea15];
fe_temp2=reshape(fe_temp2,10,15,Nt);
fe_aa=zeros(Nt*N_mode,15);
for num_nt2=1:Nt
   fe_aa(10*(num_nt2-1)+1:num_nt2*10,:)=fe_temp2(:,:,num_nt);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%D_B：盒维数   D_I：信息维数
feb1=zeros(N_mode,N_snr,Nt); feb2=zeros(N_mode,N_snr,Nt); feb3=zeros(N_mode,N_snr,Nt);
feb4=zeros(N_mode,N_snr,Nt); feb5=zeros(N_mode,N_snr,Nt); feb6=zeros(N_mode,N_snr,Nt); 
feb7=zeros(N_mode,N_snr,Nt); feb8=zeros(N_mode,N_snr,Nt); feb9=zeros(N_mode,N_snr,Nt);

for nt=1:Nt;
    for snr=0:N_snr-1
        for type=1:N_mode
            switch type
                case 1
                    y=ask2(N_code,fc,fs,fd,Ac);                
                    yr=awgn(y,snr,'measured','db');
                    [D_B,D_I]=featurefx_extraction(yr);
                    feb1(type,snr+1,nt)=D_B;feb2(type,snr+1,nt)=D_I;
                case 2
                    y=ask4(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [D_B,D_I]=featurefx_extraction(yr);
                    feb1(type,snr+1,nt)=D_B;feb2(type,snr+1,nt)=D_I;
                case 3
                    y=ask8(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [D_B,D_I]=featurefx_extraction(yr);
                    feb1(type,snr+1,nt)=D_B;feb2(type,snr+1,nt)=D_I;
                case 4
                    y=fsk2(N_code,fc,fs,fd,freqsep,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [D_B,D_I]=featurefx_extraction(yr);
                    feb1(type,snr+1,nt)=D_B;feb2(type,snr+1,nt)=D_I;
                case 5
                    y=fsk4(N_code,fc,fs,fd,freqsep,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [D_B,D_I]=featurefx_extraction(yr);
                    feb1(type,snr+1,nt)=D_B;feb2(type,snr+1,nt)=D_I;
                case 6
                    y=fsk8(N_code,fc,fs,fd,freqsep,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [D_B,D_I]=featurefx_extraction(yr);
                    feb1(type,snr+1,nt)=D_B;feb2(type,snr+1,nt)=D_I;
                case 7
                    y=psk2(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [D_B,D_I]=featurefx_extraction(yr);
                    feb1(type,snr+1,nt)=D_B;feb2(type,snr+1,nt)=D_I;
                case 8
                    y=psk4(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [D_B,D_I]=featurefx_extraction(yr);
                    feb1(type,snr+1,nt)=D_B;feb2(type,snr+1,nt)=D_I;
                case 9
                    y=psk8(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [D_B,D_I]=featurefx_extraction(yr);
                    feb1(type,snr+1,nt)=D_B;feb2(type,snr+1,nt)=D_I;
                case 10
                    y=qam16(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [D_B,D_I]=featurefx_extraction(yr);
                    feb1(type,snr+1,nt)=D_B;feb2(type,snr+1,nt)=D_I;
            end
        end
    end
end

save fxfe feb1 feb2;

mean_feb1=mean(feb1,3);mean_feb2=mean(feb2,3);mean_fe3=mean(feb3,3);
mean_fe4=mean(feb4,3);mean_fe5=mean(feb5,3);mean_fe6=mean(feb6,3);
mean_fe7=mean(feb7,3);mean_fe8=mean(feb8,3);mean_fe9=mean(feb9,3);

fe_dd=[mean_feb1;mean_feb2];
fe_dd=reshape(fe_dd,10,2);

%生成特征
fe_temp3=[feb1;feb2];
fe_temp3=reshape(fe_temp3,10,2,Nt);
fe_bb=zeros(Nt*N_mode,2);
for num_nt3=1:Nt
   fe_bb(10*(num_nt3-1)+1:num_nt3*10,:)=fe_temp3(:,:,num_nt);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%R1：Sxα(f=0)截面的循环谱幅度包络方差  R2:Sxα(f=fc)截面的循环谱幅度包络方差  R3:Sxα(f=0)截面的循环谱幅度包络均值
%Beta:特征谱Sxα(f=0)归一化的最大值β:在α轴上的谱相关的最大值与在f轴上的谱相关的最大值的比值
%P:特征谱Sx2fc(f)在f轴上有值点的平均能量和
fec1=zeros(N_mode,N_snr,Nt); fec2=zeros(N_mode,N_snr,Nt); fec3=zeros(N_mode,N_snr,Nt);
fec4=zeros(N_mode,N_snr,Nt); fec5=zeros(N_mode,N_snr,Nt); fec6=zeros(N_mode,N_snr,Nt); 
fec7=zeros(N_mode,N_snr,Nt); fec8=zeros(N_mode,N_snr,Nt); fec9=zeros(N_mode,N_snr,Nt);

for nt=1:Nt;
    for snr=0:N_snr-1
        for type=1:N_mode
            switch type
                case 1
                    y=ask2(N_code,fc,fs,fd,Ac);                
                    yr=awgn(y,snr,'measured','db');
                    [R1,R2,R3,Beta,P]=featurecsd_extraction(yr,fs,fc,df,dalpha);
                    fec1(type,snr+1,nt)=R1;fec2(type,snr+1,nt)=R2;fec3(type,snr+1,nt)=R3;
                    fec4(type,snr+1,nt)=Beta;fec5(type,snr+1,nt)=P;
                case 2
                    y=ask4(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [R1,R2,R3,Beta,P]=featurecsd_extraction(yr,fs,fc,df,dalpha);
                    fec1(type,snr+1,nt)=R1;fec2(type,snr+1,nt)=R2;fec3(type,snr+1,nt)=R3;
                    fec4(type,snr+1,nt)=Beta;fec5(type,snr+1,nt)=P;
                case 3
                    y=ask8(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [R1,R2,R3,Beta,P]=featurecsd_extraction(yr,fs,fc,df,dalpha);
                    fec1(type,snr+1,nt)=R1;fec2(type,snr+1,nt)=R2;fec3(type,snr+1,nt)=R3;
                    fec4(type,snr+1,nt)=Beta;fec5(type,snr+1,nt)=P;
                case 4
                    y=fsk2(N_code,fc,fs,fd,freqsep,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [R1,R2,R3,Beta,P]=featurecsd_extraction(yr,fs,fc,df,dalpha);
                    fec1(type,snr+1,nt)=R1;fec2(type,snr+1,nt)=R2;fec3(type,snr+1,nt)=R3;
                    fec4(type,snr+1,nt)=Beta;fec5(type,snr+1,nt)=P;
                case 5
                    y=fsk4(N_code,fc,fs,fd,freqsep,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [R1,R2,R3,Beta,P]=featurecsd_extraction(yr,fs,fc,df,dalpha);
                    fec1(type,snr+1,nt)=R1;fec2(type,snr+1,nt)=R2;fec3(type,snr+1,nt)=R3;
                    fec4(type,snr+1,nt)=Beta;fec5(type,snr+1,nt)=P;
                case 6
                    y=fsk8(N_code,fc,fs,fd,freqsep,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [R1,R2,R3,Beta,P]=featurecsd_extraction(yr,fs,fc,df,dalpha);
                    fec1(type,snr+1,nt)=R1;fec2(type,snr+1,nt)=R2;fec3(type,snr+1,nt)=R3;
                    fec4(type,snr+1,nt)=Beta;fec5(type,snr+1,nt)=P;
                case 7
                    y=psk2(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [R1,R2,R3,Beta,P]=featurecsd_extraction(yr,fs,fc,df,dalpha);
                    fec1(type,snr+1,nt)=R1;fec2(type,snr+1,nt)=R2;fec3(type,snr+1,nt)=R3;
                    fec4(type,snr+1,nt)=Beta;fec5(type,snr+1,nt)=P;
                case 8
                    y=psk4(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [R1,R2,R3,Beta,P]=featurecsd_extraction(yr,fs,fc,df,dalpha);
                    fec1(type,snr+1,nt)=R1;fec2(type,snr+1,nt)=R2;fec3(type,snr+1,nt)=R3;
                    fec4(type,snr+1,nt)=Beta;fec5(type,snr+1,nt)=P;
                case 9
                    y=psk8(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [R1,R2,R3,Beta,P]=featurecsd_extraction(yr,fs,fc,df,dalpha);
                    fec1(type,snr+1,nt)=R1;fec2(type,snr+1,nt)=R2;fec3(type,snr+1,nt)=R3;
                    fec4(type,snr+1,nt)=Beta;fec5(type,snr+1,nt)=P;
                case 10
                    y=qam16(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [R1,R2,R3,Beta,P]=featurecsd_extraction(yr,fs,fc,df,dalpha);
                    fec1(type,snr+1,nt)=R1;fec2(type,snr+1,nt)=R2;fec3(type,snr+1,nt)=R3;
                    fec4(type,snr+1,nt)=Beta;fec5(type,snr+1,nt)=P;
            end
        end
    end
end

save csdfe fec1 fec2 fec3 fec4 fec5;

mean_fec1=mean(fec1,3);mean_fec2=mean(fec2,3);mean_fec3=mean(fec3,3);
mean_fec4=mean(fec4,3);mean_fec5=mean(fec5,3);mean_fec6=mean(fec6,3);
mean_fe7=mean(fec7,3);mean_fe8=mean(fec8,3);mean_fe9=mean(fec9,3);

save csdmean mean_fec1 mean_fec2 mean_fec3 mean_fec4 mean_fec5;
fe_cc=[mean_fec1;mean_fec2;mean_fec3;mean_fec4;mean_fec5];
fe_cc=reshape(fe_cc,10,5);

%生成特征

fe_temp4=[fec1;fec2;fec3;fec4;fec5];
fe_temp4=reshape(fe_temp4,10,5,Nt);
fe_cc=zeros(Nt*N_mode,5);
for num_nt2=1:Nt
   fe_cc(10*(num_nt2-1)+1:num_nt2*10,:)=fe_temp4(:,:,num_nt);
end

sum_x=zeros(Nt*N_mode,27);
sum_x(:,1:5)=fe_har;
sum_x(:,6:20)=fe_aa;
sum_x(:,21:22)=fe_bb;
sum_x(:,23:27)=fe_cc;
%生成标签
tempy_a=[1,2,3,4,5,6,7,8,9,10];
sum_y=zeros(Nt*N_mode,1);
for tempy_num=1:Nt;
   sum_y((tempy_num-1)*N_mode+1:tempy_num*N_mode,:)=tempy_a;
end
train_x=zeros(train_Nt*N_mode,27);
test_x=zeros(test_Nt*N_mode,27);
train_x=sum_x(1:train_Nt,:);
test_x=sum_x(train_Nt+1:Nt*N_mode,:);
train_y=zeros(train_Nt*N_mode,1);
test_y=zeros(test_Nt*N_mode);
train_y=sum_y(1:train_Nt,:);
test_y=sum_y(train_Nt+1:Nt*N_mode,:);

%%%%%%%%%%%%进行归一化
FlattenedData = train_x(:)'; % 展开矩阵为一列，然后转置为一行。
MappedFlattened = mapminmax(FlattenedData, 0, 1); % 归一化。
MappedData_train = reshape(MappedFlattened, size(train_x)); % 还原为原始矩阵形式。此处不需转置回去，因为reshape恰好是按列重新排序
FlattenedData = train_x(:)'; % 展开矩阵为一列，然后转置为一行。
MappedFlattened = mapminmax(FlattenedData, 0, 1); % 归一化。
MappedData_test = reshape(MappedFlattened, size(train_x)); % 还原为原始矩阵形式。此处不需转置回去，因为reshape恰好是按列重新排序
train_x = double(MappedData_train);
test_x  = double(MappedData_test);
train_y = double(train_y);
test_y  = double(train_y); 

c=randperm(size(train_x,1));
train_x=train_x(c,:);
train_y=train_y(c,:);

d=randperm(size(test_x,1));
test_x=test_x(c,:);
test_y=test_y(c,:);

datasets=cell(2,2);
datasets{1,1}=train_x;
datasets{1,2}=train_y;
datasets{2,1}=test_x;
datasets{2,2}=test_y;
save('datasets.mat','datasets')

save train_y;
save train_x;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


