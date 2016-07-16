close all;
clear all;
clc;

%%%%%%%%%%%%%����������ͼ%%%%%%%%%%%%%%%%%%%%
fc=7e7;%�ز�Ƶ��
fs=2e8;%����Ƶ��
fd=2e6;%������
freqsep=1e6;%Ƶƫ
df=25e5;%Ƶ�ʷֱ���
dalpha=0.25e5;%ѭ��Ƶ�ʷֱ���
Ac=1;%���
Nt=100;%�����������
N_code=1000;%��Ԫ����
N_mode=10;%�ź���
N_snr=1;

fe1=zeros(N_mode,N_snr,Nt); fe2=zeros(N_mode,N_snr,Nt); fe3=zeros(N_mode,N_snr,Nt);
fe4=zeros(N_mode,N_snr,Nt); fe5=zeros(N_mode,N_snr,Nt); fe6=zeros(N_mode,N_snr,Nt); 
fe7=zeros(N_mode,N_snr,Nt); fe8=zeros(N_mode,N_snr,Nt); fe9=zeros(N_mode,N_snr,Nt);

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

%������������har
fe_temp=[fe1;fe2;fe3;fe4;fe5];
fe_temp=reshape(fe_temp,10,5,100);
fe_har=zeros(Nt*N_mode,5);
for num_nt=1:Nt
   fe_har(10*(num_nt-1)+1:num_nt*10,:)=fe_temp(:,:,num_nt);
end