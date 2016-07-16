%样本产生
close all;
clear all;
clc;
tic
fc=7e7;%载波频率
fs=2e8;%采样频率
fd=2e6;%码速率
freqsep=1e6;%频偏
df=25e5;%频率分辨率
dalpha=0.25e5;%循环频率分辨率
Ac=1;%振幅
N_code=1000;%码元个数
N_sample=1040;%样本数
N_fe=27;%特征数
N_train = 40;

mode1= zeros(N_sample,N_fe+1);
mode2= zeros(N_sample,N_fe+1);
mode3= zeros(N_sample,N_fe+1);
mode4= zeros(N_sample,N_fe+1);
mode5= zeros(N_sample,N_fe+1);
mode6= zeros(N_sample,N_fe+1);
mode7= zeros(N_sample,N_fe+1);
mode8= zeros(N_sample,N_fe+1);
mode9= zeros(N_sample,N_fe+1);
mode10= zeros(N_sample,N_fe+1);

for snr = 8:20
for num_sample=1:N_sample    
    fprintf('current snr=%d,',snr);
    fprintf('   itr=%d\n',num_sample)
    y=ask2(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
    [E1,E2,E3,E4,E5]=featurexb_extraction(yr);[D_B,D_I]=featurefx_extraction(yr);[R1,R2,R3,Beta,P]=featurecsd_extraction(yr,fs,fc,df,dalpha);
    mode1(num_sample,:)=[1,r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7,E1,E2,E3,E4,E5,D_B,D_I,R1,R2,R3,Beta,P];    
    y=ask4(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
    [E1,E2,E3,E4,E5]=featurexb_extraction(yr);[D_B,D_I]=featurefx_extraction(yr);[R1,R2,R3,Beta,P]=featurecsd_extraction(yr,fs,fc,df,dalpha);
    mode2(num_sample,:)=[2,r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7,E1,E2,E3,E4,E5,D_B,D_I,R1,R2,R3,Beta,P];    
    y=ask8(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
    [E1,E2,E3,E4,E5]=featurexb_extraction(yr);[D_B,D_I]=featurefx_extraction(yr);[R1,R2,R3,Beta,P]=featurecsd_extraction(yr,fs,fc,df,dalpha);
    mode3(num_sample,:)=[3,r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7,E1,E2,E3,E4,E5,D_B,D_I,R1,R2,R3,Beta,P];    
    y=fsk2(N_code,fc,fs,fd,freqsep,Ac);
    yr=awgn(y,snr,'measured','db');
    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
    [E1,E2,E3,E4,E5]=featurexb_extraction(yr);[D_B,D_I]=featurefx_extraction(yr);[R1,R2,R3,Beta,P]=featurecsd_extraction(yr,fs,fc,df,dalpha);
    mode4(num_sample,:)=[4,r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7,E1,E2,E3,E4,E5,D_B,D_I,R1,R2,R3,Beta,P];    
    y=fsk4(N_code,fc,fs,fd,freqsep,Ac);
    yr=awgn(y,snr,'measured','db');
    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
    [E1,E2,E3,E4,E5]=featurexb_extraction(yr);[D_B,D_I]=featurefx_extraction(yr);[R1,R2,R3,Beta,P]=featurecsd_extraction(yr,fs,fc,df,dalpha);
    mode5(num_sample,:)=[5,r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7,E1,E2,E3,E4,E5,D_B,D_I,R1,R2,R3,Beta,P];    
    y=fsk8(N_code,fc,fs,fd,freqsep,Ac);
    yr=awgn(y,snr,'measured','db');
    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
    [E1,E2,E3,E4,E5]=featurexb_extraction(yr);[D_B,D_I]=featurefx_extraction(yr);[R1,R2,R3,Beta,P]=featurecsd_extraction(yr,fs,fc,df,dalpha);
    mode6(num_sample,:)=[6,r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7,E1,E2,E3,E4,E5,D_B,D_I,R1,R2,R3,Beta,P];    
    y=psk2(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
    [E1,E2,E3,E4,E5]=featurexb_extraction(yr);[D_B,D_I]=featurefx_extraction(yr);[R1,R2,R3,Beta,P]=featurecsd_extraction(yr,fs,fc,df,dalpha);
    mode7(num_sample,:)=[7,r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7,E1,E2,E3,E4,E5,D_B,D_I,R1,R2,R3,Beta,P];    
    y=psk4(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
    [E1,E2,E3,E4,E5]=featurexb_extraction(yr);[D_B,D_I]=featurefx_extraction(yr);[R1,R2,R3,Beta,P]=featurecsd_extraction(yr,fs,fc,df,dalpha);
    mode8(num_sample,:)=[8,r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7,E1,E2,E3,E4,E5,D_B,D_I,R1,R2,R3,Beta,P];    
    y=psk8(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
    [E1,E2,E3,E4,E5]=featurexb_extraction(yr);[D_B,D_I]=featurefx_extraction(yr);[R1,R2,R3,Beta,P]=featurecsd_extraction(yr,fs,fc,df,dalpha);
    mode9(num_sample,:)=[9,r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7,E1,E2,E3,E4,E5,D_B,D_I,R1,R2,R3,Beta,P];    
    y=qam16(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
    [E1,E2,E3,E4,E5]=featurexb_extraction(yr);[D_B,D_I]=featurefx_extraction(yr);[R1,R2,R3,Beta,P]=featurecsd_extraction(yr,fs,fc,df,dalpha);
    mode10(num_sample,:)=[10,r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7,E1,E2,E3,E4,E5,D_B,D_I,R1,R2,R3,Beta,P];    
end
% sample_train=[mode1(1:N_train,:);mode2(1:N_train,:);mode3(1:N_train,:);mode4(1:N_train,:);mode5(1:N_train,:);mode6(1:N_train,:);mode7(1:N_train,:);mode8(1:N_train,:);mode9(1:N_train,:);mode10(1:N_train,:)];
% sample_test=[mode1(N_train+1:end,:);mode2(N_train+1:end,:);mode3(N_train+1:end,:);mode4(N_train+1:end,:);mode5(N_train+1:end,:);mode6(N_train+1:end,:);mode7(N_train+1:end,:);mode8(N_train+1:end,:);mode9(N_train+1:end,:);mode10(N_train+1:end,:)];
if snr <0
    ftrain = strcat('sample_train','_',num2str(abs(snr)));
    ftest = strcat('sample_test','_',num2str(abs(snr)));
    fdata = strcat('datasets','_',num2str(abs(snr)));
else
    ftrain = strcat('sample_train',num2str(snr));
    ftest = strcat('sample_test',num2str(snr));
    fdata = strcat('datasets', num2str(snr));
end

eval([ftrain,'=[mode1(1:N_train,:);mode2(1:N_train,:);mode3(1:N_train,:);mode4(1:N_train,:);mode5(1:N_train,:);mode6(1:N_train,:);mode7(1:N_train,:);mode8(1:N_train,:);mode9(1:N_train,:);mode10(1:N_train,:)];'])
eval([ftest,'=[mode1(N_train+1:end,:);mode2(N_train+1:end,:);mode3(N_train+1:end,:);mode4(N_train+1:end,:);mode5(N_train+1:end,:);mode6(N_train+1:end,:);mode7(N_train+1:end,:);mode8(N_train+1:end,:);mode9(N_train+1:end,:);mode10(N_train+1:end,:)];'])

eval(['save ',ftrain,' ',ftrain,';']);
eval(['save ',ftest,' ',ftest,';']);

eval([fdata, '=cell(2,2);']);
eval([fdata, '{1,2}=',ftrain,'(:,1);']);
eval([fdata, '{2,2}=',ftest,'(:,1);']);

eval(['[',ftrain,',',ftest,']=scaleForSVMcircle(',ftrain,',',ftest,',0,1);']);
eval([fdata, '{1,1}=',ftrain,'(:,2:end);']);
eval([fdata, '{2,1}=',ftest,'(:,2:end);']);
datasets = cell(2,2);
eval(['datasets=',fdata,';']);
save(fdata,'datasets');
% save sample_train-5 sample_train-5
% save sample_test-5 sample_test-5
end
toc
