

%train_y(1:N_sample*(end_snr-begin_snr+1),:)=y2ask;
%train_y(N_sample*(end_snr-begin_snr+1)+1:2*N_sample*(end_snr-begin_snr+1),:)=y4ask;
%train_y(2*N_sample*(end_snr-begin_snr+1)+1:3*N_sample*(end_snr-begin_snr+1),:)=y8ask;
%train_y(3*N_sample*(end_snr-begin_snr+1)+1:4*N_sample*(end_snr-begin_snr+1),:)=y2fsk;
%train_y(4*N_sample*(end_snr-begin_snr+1)+1:5*N_sample*(end_snr-begin_snr+1),:)=y4fsk;
%train_y(5*N_sample*(end_snr-begin_snr+1)+1:6*N_sample*(end_snr-begin_snr+1),:)=y8fsk;
%train_y(6*N_sample*(end_snr-begin_snr+1)+1:7*N_sample*(end_snr-begin_snr+1),:)=y2psk;
%train_y(7*N_sample*(end_snr-begin_snr+1)+1:7*N_sample*(end_snr-begin_snr+1),:)=y4psk;
%train_y(8*N_sample*(end_snr-begin_snr+1)+1:7*N_sample*(end_snr-begin_snr+1),:)=y8psk;
%train_y(6*kindnum_code*N_sample*(end_snr-begin_snr+1)+1:3*kindnum_code*N_sample*(end_snr-begin_snr+1),:)=ypsk;
%train_y(3*kindnum_code*N_sample*(end_snr-begin_snr+1)+1:4*kindnum_code*N_sample*(end_snr-begin_snr+1),:)=yqam;
fc=7e7;%�ز�Ƶ��
fs=2e8;%����Ƶ��
fd=2e6;%������
freqsep=1e6;%Ƶƫ
df=25e5;%Ƶ�ʷֱ���
dalpha=0.25e5;%ѭ��Ƶ�ʷֱ���
Ac=1;%���
N_code=15;%��Ԫ����
N_sample=90;%������
N_fe=27;%������
begin_snr=5;%��ʼ�����
end_snr=10;%��ֹ�����
kindnum_code=3;%ÿ�ֱ��������
num_code=4;%һ�����õı�������
yqam16=zeros(N_sample,N_code*100);
%qam16_sum=zeros(N_sample*(end_snr-begin_snr+1),N_code*100);   
yqam_sum=zeros(N_sample*(end_snr-begin_snr+1),N_code*100);
for snr=begin_snr:end_snr  
    for num_sample=1:N_sample   
         y=qam16(N_code,fc,fs,fd,Ac);%����һ��qam�ź�
         yr=awgn(y,snr,'measured','db');%�����ɵ�qam�ź��м���ָ������ȵ�����
         yqam16(num_sample,:)=yr;%���ƶ�����ȵ��ź����и��Ƹ�qam�źž���
    end
   yqam_sum((snr-begin_snr)*N_sample+1:(snr-begin_snr+1)*N_sample,:)=yqam16;%ָ������ȵ�qam�źŸ��Ƹ�yqam_sum�źž���
end