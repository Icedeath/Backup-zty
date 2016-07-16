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
N_snr=21;

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
                    [D_B,D_I]=featurefx_extraction(yr);
                    fe1(type,snr+1,nt)=D_B;fe2(type,snr+1,nt)=D_I;
                case 2
                    y=ask4(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [D_B,D_I]=featurefx_extraction(yr);
                    fe1(type,snr+1,nt)=D_B;fe2(type,snr+1,nt)=D_I;
                case 3
                    y=ask8(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [D_B,D_I]=featurefx_extraction(yr);
                    fe1(type,snr+1,nt)=D_B;fe2(type,snr+1,nt)=D_I;
                case 4
                    y=fsk2(N_code,fc,fs,fd,freqsep,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [D_B,D_I]=featurefx_extraction(yr);
                    fe1(type,snr+1,nt)=D_B;fe2(type,snr+1,nt)=D_I;
                case 5
                    y=fsk4(N_code,fc,fs,fd,freqsep,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [D_B,D_I]=featurefx_extraction(yr);
                    fe1(type,snr+1,nt)=D_B;fe2(type,snr+1,nt)=D_I;
                case 6
                    y=fsk8(N_code,fc,fs,fd,freqsep,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [D_B,D_I]=featurefx_extraction(yr);
                    fe1(type,snr+1,nt)=D_B;fe2(type,snr+1,nt)=D_I;
                case 7
                    y=psk2(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [D_B,D_I]=featurefx_extraction(yr);
                    fe1(type,snr+1,nt)=D_B;fe2(type,snr+1,nt)=D_I;
                case 8
                    y=psk4(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [D_B,D_I]=featurefx_extraction(yr);
                    fe1(type,snr+1,nt)=D_B;fe2(type,snr+1,nt)=D_I;
                case 9
                    y=psk8(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [D_B,D_I]=featurefx_extraction(yr);
                    fe1(type,snr+1,nt)=D_B;fe2(type,snr+1,nt)=D_I;
                case 10
                    y=qam16(N_code,fc,fs,fd,Ac);
                    yr=awgn(y,snr,'measured','db');
                    [D_B,D_I]=featurefx_extraction(yr);
                    fe1(type,snr+1,nt)=D_B;fe2(type,snr+1,nt)=D_I;
            end
        end
    end
end

save fxfe fe1 fe2;

mean_fe1=mean(fe1,3);mean_fe2=mean(fe2,3);mean_fe3=mean(fe3,3);
mean_fe4=mean(fe4,3);mean_fe5=mean(fe5,3);mean_fe6=mean(fe6,3);
mean_fe7=mean(fe7,3);mean_fe8=mean(fe8,3);mean_fe9=mean(fe9,3);

save fxmean mean_fe1 mean_fe2;

%����������10�ֵ����źš���������µı仯��Χ
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

save fxmax max_fe1 max_fe2;
save fxmin min_fe1 min_fe2;

%����������10�ֵ����ź���������ȱ仯�ķ�Χͼ
x=0:N_snr-1;
strs={'2ASK','4ASK','8ASK','2FSK','4FSK','8FSK','2PSK','4PSK','8PSK','16QAM'};
strs_fe1={'D_B','D_I'};
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
    ylabel('��������ֵ')
    title(strs_fe1(num_fe))   
end

%���������ľ�ֵ��10�ֵ����ź���������ȱ仯������ͼ
for num_fe=1:N_fe
    strs_fe=['mean_fe',num2str(num_fe)];
    fe=eval(strs_fe);
    figure,
    plot(x,fe(1,:),'-m+',x,fe(2,:),'-md',x,fe(3,:),'-mp', ...
         x,fe(4,:),'-k^',x,fe(5,:),'-k<',x,fe(6,:),'-k>',...
         x,fe(7,:),'-bx',x,fe(8,:),'-bo',x,fe(9,:),'-b*',x,fe(10,:),'-rs')
    legend(strs)
    xlabel('SNR(dB)')
    ylabel('��������ֵ')
    title(strs_fe1(num_fe))   
end