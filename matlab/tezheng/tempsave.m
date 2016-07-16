

%%%%%%%%%%%%%特征参数作图%%%%%%%%%%%%%%%%%%%%

test_Nt=1;%独立仿真次数


fe1=zeros(N_mode,N_snr,test_Nt); fe2=zeros(N_mode,N_snr,test_Nt); fe3=zeros(N_mode,N_snr,test_Nt);
fe4=zeros(N_mode,N_snr,test_Nt); fe5=zeros(N_mode,N_snr,test_Nt); fe6=zeros(N_mode,N_snr,test_Nt); 
fe7=zeros(N_mode,N_snr,test_Nt); fe8=zeros(N_mode,N_snr,test_Nt); fe9=zeros(N_mode,N_snr,test_Nt);

for test_Nt=1:test_Nt;
    for snr=0:N_snr-1
        for type=1:N_mode
            switch type
                case 1
                    y=ask2(N_code,fc,fs,fd,Ac);                
                    yr=awgn(y,snr,'measured','db');
                    [E1,E2,E3,E4,E5]=featurexb_extraction(yr);
                    fe1(type,snr+1,test_Nt)=E1;fe2(type,snr+1,test_Nt)=E2;fe3(type,snr+1,test_Nt)=E3;
                    fe4(type,snr+1,test_Nt)=E4;fe5(type,snr+1,test_Nt)=E5;
                case 2
                    y=ask4(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [E1,E2,E3,E4,E5]=featurexb_extraction(yr);
                    fe1(type,snr+1,test_Nt)=E1;fe2(type,snr+1,test_Nt)=E2;fe3(type,snr+1,test_Nt)=E3;
                    fe4(type,snr+1,test_Nt)=E4;fe5(type,snr+1,test_Nt)=E5;
                case 3
                    y=ask8(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [E1,E2,E3,E4,E5]=featurexb_extraction(yr);
                    fe1(type,snr+1,test_Nt)=E1;fe2(type,snr+1,test_Nt)=E2;fe3(type,snr+1,test_Nt)=E3;
                    fe4(type,snr+1,test_Nt)=E4;fe5(type,snr+1,test_Nt)=E5;
                case 4
                    y=fsk2(N_code,fc,fs,fd,freqsep,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [E1,E2,E3,E4,E5]=featurexb_extraction(yr);
                    fe1(type,snr+1,test_Nt)=E1;fe2(type,snr+1,test_Nt)=E2;fe3(type,snr+1,test_Nt)=E3;
                    fe4(type,snr+1,test_Nt)=E4;fe5(type,snr+1,test_Nt)=E5;
                case 5
                    y=fsk4(N_code,fc,fs,fd,freqsep,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [E1,E2,E3,E4,E5]=featurexb_extraction(yr);
                    fe1(type,snr+1,test_Nt)=E1;fe2(type,snr+1,test_Nt)=E2;fe3(type,snr+1,test_Nt)=E3;
                    fe4(type,snr+1,test_Nt)=E4;fe5(type,snr+1,test_Nt)=E5;
                case 6
                    y=fsk8(N_code,fc,fs,fd,freqsep,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [E1,E2,E3,E4,E5]=featurexb_extraction(yr);
                    fe1(type,snr+1,test_Nt)=E1;fe2(type,snr+1,test_Nt)=E2;fe3(type,snr+1,test_Nt)=E3;
                    fe4(type,snr+1,test_Nt)=E4;fe5(type,snr+1,test_Nt)=E5;
                case 7
                    y=psk2(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [E1,E2,E3,E4,E5]=featurexb_extraction(yr);
                    fe1(type,snr+1,test_Nt)=E1;fe2(type,snr+1,test_Nt)=E2;fe3(type,snr+1,test_Nt)=E3;
                    fe4(type,snr+1,test_Nt)=E4;fe5(type,snr+1,test_Nt)=E5;
                case 8
                    y=psk4(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [E1,E2,E3,E4,E5]=featurexb_extraction(yr);
                    fe1(type,snr+1,test_Nt)=E1;fe2(type,snr+1,test_Nt)=E2;fe3(type,snr+1,test_Nt)=E3;
                    fe4(type,snr+1,test_Nt)=E4;fe5(type,snr+1,test_Nt)=E5;
                case 9
                    y=psk8(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [E1,E2,E3,E4,E5]=featurexb_extraction(yr);
                    fe1(type,snr+1,test_Nt)=E1;fe2(type,snr+1,test_Nt)=E2;fe3(type,snr+1,test_Nt)=E3;
                    fe4(type,snr+1,test_Nt)=E4;fe5(type,snr+1,test_Nt)=E5;
                case 10
                    y=qam16(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [E1,E2,E3,E4,E5]=featurexb_extraction(yr);
                    fe1(type,snr+1,test_Nt)=E1;fe2(type,snr+1,test_Nt)=E2;fe3(type,snr+1,test_Nt)=E3;
                    fe4(type,snr+1,test_Nt)=E4;fe5(type,snr+1,test_Nt)=E5;
            end
        end
    end
end

save xbfe fe1 fe2 fe3 fe4 fe5;

mean_fe1=mean(fe1,3);mean_fe2=mean(fe2,3);mean_fe3=mean(fe3,3);
mean_fe4=mean(fe4,3);mean_fe5=mean(fe5,3);mean_fe6=mean(fe6,3);
mean_fe7=mean(fe7,3);mean_fe8=mean(fe8,3);mean_fe9=mean(fe9,3);

%save xbmean mean_fe1 mean_fe2 mean_fe3 mean_fe4 mean_fe5;

%特征矩阵生成har
fe_traitest_Ntemp1=[fe1;fe2;fe3;fe4;fe5];
fe_traitest_Ntemp1=reshape(fe_traitest_Ntemp1,10,5,test_Nt);
fe_trainhar=zeros(test_Nt*N_mode,5);
for num_test_Nt=1:test_Nt
   fe_trainhar(10*(num_test_Nt-1)+1:num_test_Nt*10,:)=fe_traitest_Ntemp1(:,:,num_test_Nt);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fea1=zeros(N_mode,N_snr,test_Nt); fea2=zeros(N_mode,N_snr,test_Nt); fea3=zeros(N_mode,N_snr,test_Nt);
fea4=zeros(N_mode,N_snr,test_Nt); fea5=zeros(N_mode,N_snr,test_Nt); fea6=zeros(N_mode,N_snr,test_Nt); 
fea7=zeros(N_mode,N_snr,test_Nt); fea8=zeros(N_mode,N_snr,test_Nt); fea9=zeros(N_mode,N_snr,test_Nt);
fea10=zeros(N_mode,N_snr,test_Nt);fea11=zeros(N_mode,N_snr,test_Nt);fea12=zeros(N_mode,N_snr,test_Nt);
fea13=zeros(N_mode,N_snr,test_Nt);fea14=zeros(N_mode,N_snr,test_Nt);fea15=zeros(N_mode,N_snr,test_Nt);

for test_Nt=1:test_Nt;
    for snr=0:N_snr-1
        for type=1:N_mode
            switch type
                case 1
                    y=ask2(N_code,fc,fs,fd,Ac);                
                    yr=awgn(y,snr,'measured','db');
                    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
                    fea1(type,snr+1,test_Nt)=r_max;fea2(type,snr+1,test_Nt)=E;fea3(type,snr+1,test_Nt)=m_A;fea4(type,snr+1,test_Nt)=sigma_aa;
                    fea5(type,snr+1,test_Nt)=sigma_ap;fea6(type,snr+1,test_Nt)=sigma_dp;fea7(type,snr+1,test_Nt)=sigma_af;fea8(type,snr+1,test_Nt)=P_max;
                    fea9(type,snr+1,test_Nt)=d_1;fea10(type,snr+1,test_Nt)=d_2;fea11(type,snr+1,test_Nt)=d_3;fea12(type,snr+1,test_Nt)=d_4;
                    fea13(type,snr+1,test_Nt)=d_5;fea14(type,snr+1,test_Nt)=d_6;fea15(type,snr+1,test_Nt)=d_7;
                case 2
                    y=ask4(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
                    fea1(type,snr+1,test_Nt)=r_max;fea2(type,snr+1,test_Nt)=E;fea3(type,snr+1,test_Nt)=m_A;fea4(type,snr+1,test_Nt)=sigma_aa;
                    fea5(type,snr+1,test_Nt)=sigma_ap;fea6(type,snr+1,test_Nt)=sigma_dp;fea7(type,snr+1,test_Nt)=sigma_af;fea8(type,snr+1,test_Nt)=P_max;
                    fea9(type,snr+1,test_Nt)=d_1;fea10(type,snr+1,test_Nt)=d_2;fea11(type,snr+1,test_Nt)=d_3;fea12(type,snr+1,test_Nt)=d_4;
                    fea13(type,snr+1,test_Nt)=d_5;fea14(type,snr+1,test_Nt)=d_6;fea15(type,snr+1,test_Nt)=d_7;
                case 3
                    y=ask8(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
                    fea1(type,snr+1,test_Nt)=r_max;fea2(type,snr+1,test_Nt)=E;fea3(type,snr+1,test_Nt)=m_A;fea4(type,snr+1,test_Nt)=sigma_aa;
                    fea5(type,snr+1,test_Nt)=sigma_ap;fea6(type,snr+1,test_Nt)=sigma_dp;fea7(type,snr+1,test_Nt)=sigma_af;fea8(type,snr+1,test_Nt)=P_max;
                    fea9(type,snr+1,test_Nt)=d_1;fea10(type,snr+1,test_Nt)=d_2;fea11(type,snr+1,test_Nt)=d_3;fea12(type,snr+1,test_Nt)=d_4;
                    fea13(type,snr+1,test_Nt)=d_5;fea14(type,snr+1,test_Nt)=d_6;fea15(type,snr+1,test_Nt)=d_7;
                case 4
                    y=fsk2(N_code,fc,fs,fd,freqsep,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
                    fea1(type,snr+1,test_Nt)=r_max;fea2(type,snr+1,test_Nt)=E;fea3(type,snr+1,test_Nt)=m_A;fea4(type,snr+1,test_Nt)=sigma_aa;
                    fea5(type,snr+1,test_Nt)=sigma_ap;fea6(type,snr+1,test_Nt)=sigma_dp;fea7(type,snr+1,test_Nt)=sigma_af;fea8(type,snr+1,test_Nt)=P_max;
                    fea9(type,snr+1,test_Nt)=d_1;fea10(type,snr+1,test_Nt)=d_2;fea11(type,snr+1,test_Nt)=d_3;fea12(type,snr+1,test_Nt)=d_4;
                    fea13(type,snr+1,test_Nt)=d_5;fea14(type,snr+1,test_Nt)=d_6;fea15(type,snr+1,test_Nt)=d_7;
                case 5
                    y=fsk4(N_code,fc,fs,fd,freqsep,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
                    fea1(type,snr+1,test_Nt)=r_max;fea2(type,snr+1,test_Nt)=E;fea3(type,snr+1,test_Nt)=m_A;fea4(type,snr+1,test_Nt)=sigma_aa;
                    fea5(type,snr+1,test_Nt)=sigma_ap;fea6(type,snr+1,test_Nt)=sigma_dp;fea7(type,snr+1,test_Nt)=sigma_af;fea8(type,snr+1,test_Nt)=P_max;
                    fea9(type,snr+1,test_Nt)=d_1;fea10(type,snr+1,test_Nt)=d_2;fea11(type,snr+1,test_Nt)=d_3;fea12(type,snr+1,test_Nt)=d_4;
                    fea13(type,snr+1,test_Nt)=d_5;fea14(type,snr+1,test_Nt)=d_6;fea15(type,snr+1,test_Nt)=d_7;
                case 6
                    y=fsk8(N_code,fc,fs,fd,freqsep,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
                    fea1(type,snr+1,test_Nt)=r_max;fea2(type,snr+1,test_Nt)=E;fea3(type,snr+1,test_Nt)=m_A;fea4(type,snr+1,test_Nt)=sigma_aa;
                    fea5(type,snr+1,test_Nt)=sigma_ap;fea6(type,snr+1,test_Nt)=sigma_dp;fea7(type,snr+1,test_Nt)=sigma_af;fea8(type,snr+1,test_Nt)=P_max;
                    fea9(type,snr+1,test_Nt)=d_1;fea10(type,snr+1,test_Nt)=d_2;fea11(type,snr+1,test_Nt)=d_3;fea12(type,snr+1,test_Nt)=d_4;
                    fea13(type,snr+1,test_Nt)=d_5;fea14(type,snr+1,test_Nt)=d_6;fea15(type,snr+1,test_Nt)=d_7;
                case 7
                    y=psk2(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
                    fea1(type,snr+1,test_Nt)=r_max;fea2(type,snr+1,test_Nt)=E;fea3(type,snr+1,test_Nt)=m_A;fea4(type,snr+1,test_Nt)=sigma_aa;
                    fea5(type,snr+1,test_Nt)=sigma_ap;fea6(type,snr+1,test_Nt)=sigma_dp;fea7(type,snr+1,test_Nt)=sigma_af;fea8(type,snr+1,test_Nt)=P_max;
                    fea9(type,snr+1,test_Nt)=d_1;fea10(type,snr+1,test_Nt)=d_2;fea11(type,snr+1,test_Nt)=d_3;fea12(type,snr+1,test_Nt)=d_4;
                    fea13(type,snr+1,test_Nt)=d_5;fea14(type,snr+1,test_Nt)=d_6;fea15(type,snr+1,test_Nt)=d_7;
                case 8
                    y=psk4(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
                    fea1(type,snr+1,test_Nt)=r_max;fea2(type,snr+1,test_Nt)=E;fea3(type,snr+1,test_Nt)=m_A;fea4(type,snr+1,test_Nt)=sigma_aa;
                    fea5(type,snr+1,test_Nt)=sigma_ap;fea6(type,snr+1,test_Nt)=sigma_dp;fea7(type,snr+1,test_Nt)=sigma_af;fea8(type,snr+1,test_Nt)=P_max;
                    fea9(type,snr+1,test_Nt)=d_1;fea10(type,snr+1,test_Nt)=d_2;fea11(type,snr+1,test_Nt)=d_3;fea12(type,snr+1,test_Nt)=d_4;
                    fea13(type,snr+1,test_Nt)=d_5;fea14(type,snr+1,test_Nt)=d_6;fea15(type,snr+1,test_Nt)=d_7;
                case 9
                    y=psk8(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
                    fea1(type,snr+1,test_Nt)=r_max;fea2(type,snr+1,test_Nt)=E;fea3(type,snr+1,test_Nt)=m_A;fea4(type,snr+1,test_Nt)=sigma_aa;
                    fea5(type,snr+1,test_Nt)=sigma_ap;fea6(type,snr+1,test_Nt)=sigma_dp;fea7(type,snr+1,test_Nt)=sigma_af;fea8(type,snr+1,test_Nt)=P_max;
                    fea9(type,snr+1,test_Nt)=d_1;fea10(type,snr+1,test_Nt)=d_2;fea11(type,snr+1,test_Nt)=d_3;fea12(type,snr+1,test_Nt)=d_4;
                    fea13(type,snr+1,test_Nt)=d_5;fea14(type,snr+1,test_Nt)=d_6;fea15(type,snr+1,test_Nt)=d_7;
                case 10
                    y=qam16(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
                    fea1(type,snr+1,test_Nt)=r_max;fea2(type,snr+1,test_Nt)=E;fea3(type,snr+1,test_Nt)=m_A;fea4(type,snr+1,test_Nt)=sigma_aa;
                    fea5(type,snr+1,test_Nt)=sigma_ap;fea6(type,snr+1,test_Nt)=sigma_dp;fea7(type,snr+1,test_Nt)=sigma_af;fea8(type,snr+1,test_Nt)=P_max;
                    fea9(type,snr+1,test_Nt)=d_1;fea10(type,snr+1,test_Nt)=d_2;fea11(type,snr+1,test_Nt)=d_3;fea12(type,snr+1,test_Nt)=d_4;
                    fea13(type,snr+1,test_Nt)=d_5;fea14(type,snr+1,test_Nt)=d_6;fea15(type,snr+1,test_Nt)=d_7;
            end
        end
    end
end

%save ssgjfe fea1 fea2 fea3 fea4 fea5 fea6 fea7 fea8 fea9 fea10 fea11 fea12 fea13 fea14 fea15;

mean_fea1=mean(fea1,3);mean_fea2=mean(fea2,3);mean_fea3=mean(fea3,3);
mean_fea4=mean(fea4,3);mean_fea5=mean(fea5,3);mean_fea6=mean(fea6,3);
mean_fea7=mean(fea7,3);mean_fea8=mean(fea8,3);mean_fea9=mean(fea9,3);
mean_fea10=mean(fea10,3);mean_fea11=mean(fea11,3);mean_fea12=mean(fea12,3);
mean_fea13=mean(fea13,3);mean_fea14=mean(fea14,3);mean_fea15=mean(fea15,3);

%save ssgjmean mean_fea1 mean_fea2 mean_fea3 mean_fea4 mean_fea5 mean_fea6 mean_fea7 mean_fea8 mean_fea9 mean_fea10 mean_fea11 mean_fea12 mean_fea13 mean_fea14 mean_fea15;

%fe_ss=[mean_fea1;mean_fea2;mean_fea3;mean_fea4;mean_fea5;mean_fea6;mean_fea7;mean_fea8;mean_fea9;mean_fea10;mean_fea11;mean_fea12;mean_fea13;mean_fea14;mean_fea15];
%fe_ss=reshape(fe_ss,10,15);

%生成特征
fe_testtemp2=[fea1;fea2;fea3;fea4;fea5;fea6;fea7;fea8;fea9;fea10;fea11;fea12;fea13;fea14;fea15];
fe_testtemp2=reshape(fe_testtemp2,10,15,test_Nt);
fe_aa=zeros(test_Nt*N_mode,15);
for num_test_Nt2=1:test_Nt
   fe_aa(10*(num_test_Nt2-1)+1:num_test_Nt2*10,:)=fe_testtemp2(:,:,num_test_Nt);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
feb1=zeros(N_mode,N_snr,test_Nt); feb2=zeros(N_mode,N_snr,test_Nt); feb3=zeros(N_mode,N_snr,test_Nt);
feb4=zeros(N_mode,N_snr,test_Nt); feb5=zeros(N_mode,N_snr,test_Nt); feb6=zeros(N_mode,N_snr,test_Nt); 
feb7=zeros(N_mode,N_snr,test_Nt); feb8=zeros(N_mode,N_snr,test_Nt); feb9=zeros(N_mode,N_snr,test_Nt);

for test_Nt=1:test_Nt;
    for snr=0:N_snr-1
        for type=1:N_mode
            switch type
                case 1
                    y=ask2(N_code,fc,fs,fd,Ac);                
                    yr=awgn(y,snr,'measured','db');
                    [D_B,D_I]=featurefx_extraction(yr);
                    feb1(type,snr+1,test_Nt)=D_B;feb2(type,snr+1,test_Nt)=D_I;
                case 2
                    y=ask4(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [D_B,D_I]=featurefx_extraction(yr);
                    feb1(type,snr+1,test_Nt)=D_B;feb2(type,snr+1,test_Nt)=D_I;
                case 3
                    y=ask8(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [D_B,D_I]=featurefx_extraction(yr);
                    feb1(type,snr+1,test_Nt)=D_B;feb2(type,snr+1,test_Nt)=D_I;
                case 4
                    y=fsk2(N_code,fc,fs,fd,freqsep,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [D_B,D_I]=featurefx_extraction(yr);
                    feb1(type,snr+1,test_Nt)=D_B;feb2(type,snr+1,test_Nt)=D_I;
                case 5
                    y=fsk4(N_code,fc,fs,fd,freqsep,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [D_B,D_I]=featurefx_extraction(yr);
                    feb1(type,snr+1,test_Nt)=D_B;feb2(type,snr+1,test_Nt)=D_I;
                case 6
                    y=fsk8(N_code,fc,fs,fd,freqsep,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [D_B,D_I]=featurefx_extraction(yr);
                    feb1(type,snr+1,test_Nt)=D_B;feb2(type,snr+1,test_Nt)=D_I;
                case 7
                    y=psk2(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [D_B,D_I]=featurefx_extraction(yr);
                    feb1(type,snr+1,test_Nt)=D_B;feb2(type,snr+1,test_Nt)=D_I;
                case 8
                    y=psk4(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [D_B,D_I]=featurefx_extraction(yr);
                    feb1(type,snr+1,test_Nt)=D_B;feb2(type,snr+1,test_Nt)=D_I;
                case 9
                    y=psk8(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [D_B,D_I]=featurefx_extraction(yr);
                    feb1(type,snr+1,test_Nt)=D_B;feb2(type,snr+1,test_Nt)=D_I;
                case 10
                    y=qam16(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [D_B,D_I]=featurefx_extraction(yr);
                    feb1(type,snr+1,test_Nt)=D_B;feb2(type,snr+1,test_Nt)=D_I;
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
fe_temp3=reshape(fe_temp3,10,2,test_Nt);
fe_testbb=zeros(test_Nt*N_mode,2);
for num_test_Nt3=1:test_Nt
   fe_testbb(10*(num_test_Nt3-1)+1:num_test_Nt3*10,:)=fe_temp3(:,:,num_test_Nt);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fec1=zeros(N_mode,N_snr,test_Nt); fec2=zeros(N_mode,N_snr,test_Nt); fec3=zeros(N_mode,N_snr,test_Nt);
fec4=zeros(N_mode,N_snr,test_Nt); fec5=zeros(N_mode,N_snr,test_Nt); fec6=zeros(N_mode,N_snr,test_Nt); 
fec7=zeros(N_mode,N_snr,test_Nt); fec8=zeros(N_mode,N_snr,test_Nt); fec9=zeros(N_mode,N_snr,test_Nt);

for test_Nt=1:test_Nt;
    for snr=0:N_snr-1
        for type=1:N_mode
            switch type
                case 1
                    y=ask2(N_code,fc,fs,fd,Ac);                
                    yr=awgn(y,snr,'measured','db');
                    [R1,R2,R3,Beta,P]=featurecsd_extraction(yr,fs,fc,df,dalpha);
                    fec1(type,snr+1,test_Nt)=R1;fec2(type,snr+1,test_Nt)=R2;fec3(type,snr+1,test_Nt)=R3;
                    fe4(type,snr+1,test_Nt)=Beta;fec5(type,snr+1,test_Nt)=P;
                case 2
                    y=ask4(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [R1,R2,R3,Beta,P]=featurecsd_extraction(yr,fs,fc,df,dalpha);
                    fec1(type,snr+1,test_Nt)=R1;fec2(type,snr+1,test_Nt)=R2;fec3(type,snr+1,test_Nt)=R3;
                    fe4(type,snr+1,test_Nt)=Beta;fec5(type,snr+1,test_Nt)=P;
                case 3
                    y=ask8(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [R1,R2,R3,Beta,P]=featurecsd_extraction(yr,fs,fc,df,dalpha);
                    fec1(type,snr+1,test_Nt)=R1;fec2(type,snr+1,test_Nt)=R2;fec3(type,snr+1,test_Nt)=R3;
                    fe4(type,snr+1,test_Nt)=Beta;fec5(type,snr+1,test_Nt)=P;
                case 4
                    y=fsk2(N_code,fc,fs,fd,freqsep,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [R1,R2,R3,Beta,P]=featurecsd_extraction(yr,fs,fc,df,dalpha);
                    fec1(type,snr+1,test_Nt)=R1;fec2(type,snr+1,test_Nt)=R2;fec3(type,snr+1,test_Nt)=R3;
                    fe4(type,snr+1,test_Nt)=Beta;fec5(type,snr+1,test_Nt)=P;
                case 5
                    y=fsk4(N_code,fc,fs,fd,freqsep,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [R1,R2,R3,Beta,P]=featurecsd_extraction(yr,fs,fc,df,dalpha);
                    fec1(type,snr+1,test_Nt)=R1;fec2(type,snr+1,test_Nt)=R2;fec3(type,snr+1,test_Nt)=R3;
                    fe4(type,snr+1,test_Nt)=Beta;fec5(type,snr+1,test_Nt)=P;
                case 6
                    y=fsk8(N_code,fc,fs,fd,freqsep,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [R1,R2,R3,Beta,P]=featurecsd_extraction(yr,fs,fc,df,dalpha);
                    fec1(type,snr+1,test_Nt)=R1;fec2(type,snr+1,test_Nt)=R2;fec3(type,snr+1,test_Nt)=R3;
                    fe4(type,snr+1,test_Nt)=Beta;fec5(type,snr+1,test_Nt)=P;
                case 7
                    y=psk2(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [R1,R2,R3,Beta,P]=featurecsd_extraction(yr,fs,fc,df,dalpha);
                    fec1(type,snr+1,test_Nt)=R1;fec2(type,snr+1,test_Nt)=R2;fec3(type,snr+1,test_Nt)=R3;
                    fe4(type,snr+1,test_Nt)=Beta;fec5(type,snr+1,test_Nt)=P;
                case 8
                    y=psk4(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [R1,R2,R3,Beta,P]=featurecsd_extraction(yr,fs,fc,df,dalpha);
                    fec1(type,snr+1,test_Nt)=R1;fec2(type,snr+1,test_Nt)=R2;fec3(type,snr+1,test_Nt)=R3;
                    fe4(type,snr+1,test_Nt)=Beta;fec5(type,snr+1,test_Nt)=P;
                case 9
                    y=psk8(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [R1,R2,R3,Beta,P]=featurecsd_extraction(yr,fs,fc,df,dalpha);
                    fec1(type,snr+1,test_Nt)=R1;fec2(type,snr+1,test_Nt)=R2;fec3(type,snr+1,test_Nt)=R3;
                    fe4(type,snr+1,test_Nt)=Beta;fec5(type,snr+1,test_Nt)=P;
                case 10
                    y=qam16(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [R1,R2,R3,Beta,P]=featurecsd_extraction(yr,fs,fc,df,dalpha);
                    fec1(type,snr+1,test_Nt)=R1;fec2(type,snr+1,test_Nt)=R2;fec3(type,snr+1,test_Nt)=R3;
                    fe4(type,snr+1,test_Nt)=Beta;fec5(type,snr+1,test_Nt)=P;
            end
        end
    end
end

save csdfe fec1 fec2 fec3 fe4 fec5;

mean_fec1=mean(fec1,3);mean_fec2=mean(fec2,3);mean_fec3=mean(fec3,3);
mean_fec4=mean(fe4,3);mean_fec5=mean(fec5,3);mean_fec6=mean(fec6,3);
mean_fe7=mean(fec7,3);mean_fe8=mean(fec8,3);mean_fe9=mean(fec9,3);

save csdmean mean_fec1 mean_fec2 mean_fec3 mean_fec4 mean_fec5;
fe_testcc=[mean_fec1;mean_fec2;mean_fec3;mean_fec4;mean_fec5];
fe_testcc=reshape(fe_testcc,10,5);

%生成特征

fe_temp4=[fec1;fec2;fec3;fec4;fec5];
fe_temp4=reshape(fe_temp4,10,5,test_Nt);
fe_testcc=zeros(test_Nt*N_mode,5);
for num_test_Nt2=1:test_Nt
   fe_testcc(10*(num_test_Nt2-1)+1:num_test_Nt2*10,:)=fe_temp4(:,:,num_test_Nt);
end

test_x=zeros(test_Nt*N_mode,27);
test_x(:,1:5)=fe_trainhar;
test_x(:,6:20)=fe_aa;
test_x(:,21:22)=fe_bb;
test_x(:,23:27)=fe_testcc;
%生成标签
%tempy_a=[1,2,3,4,5,6,7,8,9,10];
test_y=zeros(test_Nt*N_mode,1);
for tempy_num=1:test_Nt;
   test_y((tempy_num-1)*N_mode+1:tempy_num*N_mode,:)=tempy_a;
end

save test_y;
save test_x;