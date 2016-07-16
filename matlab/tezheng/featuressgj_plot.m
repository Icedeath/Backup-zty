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
Nt=100;%独立仿真次数
N_code=1000;%码元个数
N_mode=10;%信号数
N_snr=21;

fe1=zeros(N_mode,N_snr,Nt); fe2=zeros(N_mode,N_snr,Nt); fe3=zeros(N_mode,N_snr,Nt);
fe4=zeros(N_mode,N_snr,Nt); fe5=zeros(N_mode,N_snr,Nt); fe6=zeros(N_mode,N_snr,Nt); 
fe7=zeros(N_mode,N_snr,Nt); fe8=zeros(N_mode,N_snr,Nt); fe9=zeros(N_mode,N_snr,Nt);
fe10=zeros(N_mode,N_snr,Nt);fe11=zeros(N_mode,N_snr,Nt);fe12=zeros(N_mode,N_snr,Nt);
fe13=zeros(N_mode,N_snr,Nt);fe14=zeros(N_mode,N_snr,Nt);fe15=zeros(N_mode,N_snr,Nt);

for nt=1:Nt;
    for snr=0:N_snr-1
        for type=1:N_mode
            switch type
                case 1
                    y=ask2(N_code,fc,fs,fd,Ac);                
                    yr=awgn(y,snr,'measured','db');
                    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
                    fe1(type,snr+1,nt)=r_max;fe2(type,snr+1,nt)=E;fe3(type,snr+1,nt)=m_A;fe4(type,snr+1,nt)=sigma_aa;
                    fe5(type,snr+1,nt)=sigma_ap;fe6(type,snr+1,nt)=sigma_dp;fe7(type,snr+1,nt)=sigma_af;fe8(type,snr+1,nt)=P_max;
                    fe9(type,snr+1,nt)=d_1;fe10(type,snr+1,nt)=d_2;fe11(type,snr+1,nt)=d_3;fe12(type,snr+1,nt)=d_4;
                    fe13(type,snr+1,nt)=d_5;fe14(type,snr+1,nt)=d_6;fe15(type,snr+1,nt)=d_7;
                case 2
                    y=ask4(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
                    fe1(type,snr+1,nt)=r_max;fe2(type,snr+1,nt)=E;fe3(type,snr+1,nt)=m_A;fe4(type,snr+1,nt)=sigma_aa;
                    fe5(type,snr+1,nt)=sigma_ap;fe6(type,snr+1,nt)=sigma_dp;fe7(type,snr+1,nt)=sigma_af;fe8(type,snr+1,nt)=P_max;
                    fe9(type,snr+1,nt)=d_1;fe10(type,snr+1,nt)=d_2;fe11(type,snr+1,nt)=d_3;fe12(type,snr+1,nt)=d_4;
                    fe13(type,snr+1,nt)=d_5;fe14(type,snr+1,nt)=d_6;fe15(type,snr+1,nt)=d_7;
                case 3
                    y=ask8(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
                    fe1(type,snr+1,nt)=r_max;fe2(type,snr+1,nt)=E;fe3(type,snr+1,nt)=m_A;fe4(type,snr+1,nt)=sigma_aa;
                    fe5(type,snr+1,nt)=sigma_ap;fe6(type,snr+1,nt)=sigma_dp;fe7(type,snr+1,nt)=sigma_af;fe8(type,snr+1,nt)=P_max;
                    fe9(type,snr+1,nt)=d_1;fe10(type,snr+1,nt)=d_2;fe11(type,snr+1,nt)=d_3;fe12(type,snr+1,nt)=d_4;
                    fe13(type,snr+1,nt)=d_5;fe14(type,snr+1,nt)=d_6;fe15(type,snr+1,nt)=d_7;
                case 4
                    y=fsk2(N_code,fc,fs,fd,freqsep,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
                    fe1(type,snr+1,nt)=r_max;fe2(type,snr+1,nt)=E;fe3(type,snr+1,nt)=m_A;fe4(type,snr+1,nt)=sigma_aa;
                    fe5(type,snr+1,nt)=sigma_ap;fe6(type,snr+1,nt)=sigma_dp;fe7(type,snr+1,nt)=sigma_af;fe8(type,snr+1,nt)=P_max;
                    fe9(type,snr+1,nt)=d_1;fe10(type,snr+1,nt)=d_2;fe11(type,snr+1,nt)=d_3;fe12(type,snr+1,nt)=d_4;
                    fe13(type,snr+1,nt)=d_5;fe14(type,snr+1,nt)=d_6;fe15(type,snr+1,nt)=d_7;
                case 5
                    y=fsk4(N_code,fc,fs,fd,freqsep,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
                    fe1(type,snr+1,nt)=r_max;fe2(type,snr+1,nt)=E;fe3(type,snr+1,nt)=m_A;fe4(type,snr+1,nt)=sigma_aa;
                    fe5(type,snr+1,nt)=sigma_ap;fe6(type,snr+1,nt)=sigma_dp;fe7(type,snr+1,nt)=sigma_af;fe8(type,snr+1,nt)=P_max;
                    fe9(type,snr+1,nt)=d_1;fe10(type,snr+1,nt)=d_2;fe11(type,snr+1,nt)=d_3;fe12(type,snr+1,nt)=d_4;
                    fe13(type,snr+1,nt)=d_5;fe14(type,snr+1,nt)=d_6;fe15(type,snr+1,nt)=d_7;
                case 6
                    y=fsk8(N_code,fc,fs,fd,freqsep,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
                    fe1(type,snr+1,nt)=r_max;fe2(type,snr+1,nt)=E;fe3(type,snr+1,nt)=m_A;fe4(type,snr+1,nt)=sigma_aa;
                    fe5(type,snr+1,nt)=sigma_ap;fe6(type,snr+1,nt)=sigma_dp;fe7(type,snr+1,nt)=sigma_af;fe8(type,snr+1,nt)=P_max;
                    fe9(type,snr+1,nt)=d_1;fe10(type,snr+1,nt)=d_2;fe11(type,snr+1,nt)=d_3;fe12(type,snr+1,nt)=d_4;
                    fe13(type,snr+1,nt)=d_5;fe14(type,snr+1,nt)=d_6;fe15(type,snr+1,nt)=d_7;
                case 7
                    y=psk2(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
                    fe1(type,snr+1,nt)=r_max;fe2(type,snr+1,nt)=E;fe3(type,snr+1,nt)=m_A;fe4(type,snr+1,nt)=sigma_aa;
                    fe5(type,snr+1,nt)=sigma_ap;fe6(type,snr+1,nt)=sigma_dp;fe7(type,snr+1,nt)=sigma_af;fe8(type,snr+1,nt)=P_max;
                    fe9(type,snr+1,nt)=d_1;fe10(type,snr+1,nt)=d_2;fe11(type,snr+1,nt)=d_3;fe12(type,snr+1,nt)=d_4;
                    fe13(type,snr+1,nt)=d_5;fe14(type,snr+1,nt)=d_6;fe15(type,snr+1,nt)=d_7;
                case 8
                    y=psk4(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
                    fe1(type,snr+1,nt)=r_max;fe2(type,snr+1,nt)=E;fe3(type,snr+1,nt)=m_A;fe4(type,snr+1,nt)=sigma_aa;
                    fe5(type,snr+1,nt)=sigma_ap;fe6(type,snr+1,nt)=sigma_dp;fe7(type,snr+1,nt)=sigma_af;fe8(type,snr+1,nt)=P_max;
                    fe9(type,snr+1,nt)=d_1;fe10(type,snr+1,nt)=d_2;fe11(type,snr+1,nt)=d_3;fe12(type,snr+1,nt)=d_4;
                    fe13(type,snr+1,nt)=d_5;fe14(type,snr+1,nt)=d_6;fe15(type,snr+1,nt)=d_7;
                case 9
                    y=psk8(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
                    fe1(type,snr+1,nt)=r_max;fe2(type,snr+1,nt)=E;fe3(type,snr+1,nt)=m_A;fe4(type,snr+1,nt)=sigma_aa;
                    fe5(type,snr+1,nt)=sigma_ap;fe6(type,snr+1,nt)=sigma_dp;fe7(type,snr+1,nt)=sigma_af;fe8(type,snr+1,nt)=P_max;
                    fe9(type,snr+1,nt)=d_1;fe10(type,snr+1,nt)=d_2;fe11(type,snr+1,nt)=d_3;fe12(type,snr+1,nt)=d_4;
                    fe13(type,snr+1,nt)=d_5;fe14(type,snr+1,nt)=d_6;fe15(type,snr+1,nt)=d_7;
                case 10
                    y=qam16(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
                    fe1(type,snr+1,nt)=r_max;fe2(type,snr+1,nt)=E;fe3(type,snr+1,nt)=m_A;fe4(type,snr+1,nt)=sigma_aa;
                    fe5(type,snr+1,nt)=sigma_ap;fe6(type,snr+1,nt)=sigma_dp;fe7(type,snr+1,nt)=sigma_af;fe8(type,snr+1,nt)=P_max;
                    fe9(type,snr+1,nt)=d_1;fe10(type,snr+1,nt)=d_2;fe11(type,snr+1,nt)=d_3;fe12(type,snr+1,nt)=d_4;
                    fe13(type,snr+1,nt)=d_5;fe14(type,snr+1,nt)=d_6;fe15(type,snr+1,nt)=d_7;
            end
        end
    end
end

save ssgjfe fe1 fe2 fe3 fe4 fe5 fe6 fe7 fe8 fe9 fe10 fe11 fe12 fe13 fe14 fe15;

mean_fe1=mean(fe1,3);mean_fe2=mean(fe2,3);mean_fe3=mean(fe3,3);
mean_fe4=mean(fe4,3);mean_fe5=mean(fe5,3);mean_fe6=mean(fe6,3);
mean_fe7=mean(fe7,3);mean_fe8=mean(fe8,3);mean_fe9=mean(fe9,3);
mean_fe10=mean(fe10,3);mean_fe11=mean(fe11,3);mean_fe12=mean(fe12,3);
mean_fe13=mean(fe13,3);mean_fe14=mean(fe14,3);mean_fe15=mean(fe15,3);

save ssgjmean mean_fe1 mean_fe2 mean_fe3 mean_fe4 mean_fe5 mean_fe6 mean_fe7 mean_fe8 mean_fe9 mean_fe10 mean_fe11 mean_fe12 mean_fe13 mean_fe14 mean_fe15;

%特征参数在10种调制信号、各信噪比下的变化范围
for i=1:N_mode
    for j=1:N_snr
        max_fe1(i,j)=max(fe1(i,j,:));
        min_fe1(i,j)=min(fe1(i,j,:));
    end
end

for i=1:N_mode
    for j=1:N_snr
        max_fe2(i,j)=max(fe2(i,j,:));
        min_fe2(i,j)=min(fe2(i,j,:));
    end
end

for i=1:N_mode
    for j=1:N_snr
        max_fe3(i,j)=max(fe3(i,j,:));
        min_fe3(i,j)=min(fe3(i,j,:));
    end
end

for i=1:N_mode
    for j=1:N_snr
        max_fe4(i,j)=max(fe4(i,j,:));
        min_fe4(i,j)=min(fe4(i,j,:));
    end
end

for i=1:N_mode
    for j=1:N_snr
        max_fe5(i,j)=max(fe5(i,j,:));
        min_fe5(i,j)=min(fe5(i,j,:));
    end
end

for i=1:N_mode
    for j=1:N_snr
        max_fe6(i,j)=max(fe6(i,j,:));
        min_fe6(i,j)=min(fe6(i,j,:));
    end
end

for i=1:N_mode
    for j=1:N_snr
        max_fe7(i,j)=max(fe7(i,j,:));
        min_fe7(i,j)=min(fe7(i,j,:));
    end
end

for i=1:N_mode
    for j=1:N_snr
        max_fe8(i,j)=max(fe8(i,j,:));
        min_fe8(i,j)=min(fe8(i,j,:));
    end
end

for i=1:N_mode
    for j=1:N_snr
        max_fe9(i,j)=max(fe9(i,j,:));
        min_fe9(i,j)=min(fe9(i,j,:));
    end
end

for i=1:N_mode
    for j=1:N_snr
        max_fe10(i,j)=max(fe10(i,j,:));
        min_fe10(i,j)=min(fe10(i,j,:));
    end
end

for i=1:N_mode
    for j=1:N_snr
        max_fe11(i,j)=max(fe11(i,j,:));
        min_fe11(i,j)=min(fe11(i,j,:));
    end
end

for i=1:N_mode
    for j=1:N_snr
        max_fe12(i,j)=max(fe12(i,j,:));
        min_fe12(i,j)=min(fe12(i,j,:));
    end
end

for i=1:N_mode
    for j=1:N_snr
        max_fe13(i,j)=max(fe13(i,j,:));
        min_fe13(i,j)=min(fe13(i,j,:));
    end
end

for i=1:N_mode
    for j=1:N_snr
        max_fe14(i,j)=max(fe14(i,j,:));
        min_fe14(i,j)=min(fe14(i,j,:));
    end
end

for i=1:N_mode
    for j=1:N_snr
        max_fe15(i,j)=max(fe15(i,j,:));
        min_fe15(i,j)=min(fe15(i,j,:));
    end
end

save ssgjmax max_fe1 max_fe2 max_fe3 max_fe4 max_fe5 max_fe6 max_fe7 max_fe8 max_fe9 max_fe10 max_fe11 max_fe12 max_fe13 max_fe14 max_fe15;
save ssgjmin min_fe1 min_fe2 min_fe3 min_fe4 min_fe5 min_fe6 min_fe7 min_fe8 min_fe9 min_fe10 min_fe11 min_fe12 min_fe13 min_fe14 min_fe15;

%特征参数在10种调制信号下随信噪比变化的范围图
x=0:N_snr-1;
strs={'2ASK','4ASK','8ASK','2FSK','4FSK','8FSK','2PSK','4PSK','8PSK','16QAM'};
strs_fe1={'r_{max}','E','m_A','\sigma_{aa}','\sigma_{ap}','\sigma_{dp}','\sigma_{af}','P_{max}','d_1','d_2','d_3','d_4','d_5','d_6','d_7'};
N_fe=length(strs_fe1);
for num_fe=1:N_fe
    strs_fe=['max_fe',num2str(num_fe)];
    fe=eval(strs_fe);
    figure,
    plot(x,fe(1,:),'-m+',x,fe(2,:),'-md',x,fe(3,:),'-mp', ...
         x,fe(4,:),'-k^',x,fe(5,:),'-k<',x,fe(6,:),'-k>',...
         x,fe(7,:),'-bx',x,fe(8,:),'-bo',x,fe(9,:),'-b*',x,fe(10,:),'-rs')
    legend(strs)
    hold;
    strs_fe=['min_fe',num2str(num_fe)];
    fe=eval(strs_fe);
    plot(x,fe(1,:),':m+',x,fe(2,:),':md',x,fe(3,:),':mp', ...
         x,fe(4,:),':k^',x,fe(5,:),':k<',x,fe(6,:),':k>',...
         x,fe(7,:),':bx',x,fe(8,:),':bo',x,fe(9,:),':b*',x,fe(10,:),':rs')
    legend(strs)
    xlabel('SNR(dB)')
    ylabel('特征参数值')
    title(strs_fe1(num_fe))   
end

%特征参数的均值在10种调制信号下随信噪比变化的曲线图
for num_fe=1:N_fe
    strs_fe=['mean_fe',num2str(num_fe)];
    fe=eval(strs_fe);
    figure,
    plot(x,fe(1,:),'-m+',x,fe(2,:),'-md',x,fe(3,:),'-mp', ...
         x,fe(4,:),'-k^',x,fe(5,:),'-k<',x,fe(6,:),'-k>',...
         x,fe(7,:),'-bx',x,fe(8,:),'-bo',x,fe(9,:),'-b*',x,fe(10,:),'-rs')
    legend(strs)
    xlabel('SNR(dB)')
    ylabel('特征参数值')
    title(strs_fe1(num_fe))   
end