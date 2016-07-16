clear all;
clc;

fc=7e7;%�ز�Ƶ��
fs=2e8;%����Ƶ��
fd=2e6;%������
freqsep=1e6;%Ƶƫ
df=25e5;%Ƶ�ʷֱ���
dalpha=0.25e5;%ѭ��Ƶ�ʷֱ���
Ac=1;%���
N_code=10;%��Ԫ����6
N_sample=300;%ѵ��������
N_sample_test=N_sample/2;%����������Ϊѵ��������һ��
N_fe=27;%������
begin_snr=10;%��ʼ�����
end_snr=10;%��ֹ�����
kindnum_code=3;%ÿ�ֱ��������
num_code=4;%һ�����õı�������
x_sum=zeros(num_code*kindnum_code*N_sample*(end_snr-begin_snr+1)*3/2,N_code*100);
train_x=Signal_g(fc,fs,fd,freqsep,df,dalpha,Ac,N_code,N_sample,N_fe,begin_snr,end_snr,kindnum_code,num_code);
test_x=Signal_g(fc,fs,fd,freqsep,df,dalpha,Ac,N_code,N_sample_test,N_fe,begin_snr,end_snr,kindnum_code,num_code);
x_sum(1:num_code*kindnum_code*N_sample*(end_snr-begin_snr+1),:)=train_x;
x_sum(num_code*kindnum_code*N_sample*(end_snr-begin_snr+1)+1:num_code*kindnum_code*N_sample*(end_snr-begin_snr+1)*3/2,:)=test_x;

%��ǩΪask�ź�Ϊ1000��fsk�ź�Ϊ0100��psk�ź�Ϊ0010��qam�ź�Ϊ0001,���������������λѵ����һ��
train_y=zeros(num_code*kindnum_code*N_sample*(end_snr-begin_snr+1),4);
test_y=zeros(0.5*num_code*kindnum_code*N_sample*(end_snr-begin_snr+1),4);
yask=ones(kindnum_code*N_sample*(end_snr-begin_snr+1),1)*[1 0 0 0];
yfsk=ones(kindnum_code*N_sample*(end_snr-begin_snr+1),1)*[0 1 0 0];
ypsk=ones(kindnum_code*N_sample*(end_snr-begin_snr+1),1)*[0 0 1 0];
yqam=ones(kindnum_code*N_sample*(end_snr-begin_snr+1),1)*[0 0 0 1];
test_yask=ones(kindnum_code*N_sample*(end_snr-begin_snr+1)/2,1)*[1 0 0 0];
test_yfsk=ones(kindnum_code*N_sample*(end_snr-begin_snr+1)/2,1)*[0 1 0 0];
test_ypsk=ones(kindnum_code*N_sample*(end_snr-begin_snr+1)/2,1)*[0 0 1 0];
test_yqam=ones(kindnum_code*N_sample*(end_snr-begin_snr+1)/2,1)*[0 0 0 1];
train_y(1:kindnum_code*N_sample*(end_snr-begin_snr+1),:)=yask;
train_y(kindnum_code*N_sample*(end_snr-begin_snr+1)+1:2*kindnum_code*N_sample*(end_snr-begin_snr+1),:)=yfsk;
train_y(2*kindnum_code*N_sample*(end_snr-begin_snr+1)+1:3*kindnum_code*N_sample*(end_snr-begin_snr+1),:)=ypsk;
train_y(3*kindnum_code*N_sample*(end_snr-begin_snr+1)+1:4*kindnum_code*N_sample*(end_snr-begin_snr+1),:)=yqam;
test_y(1:0.5*kindnum_code*N_sample*(end_snr-begin_snr+1),:)=test_yask;
test_y(0.5*kindnum_code*N_sample*(end_snr-begin_snr+1)+1:kindnum_code*N_sample*(end_snr-begin_snr+1),:)=test_yfsk;
test_y(kindnum_code*N_sample*(end_snr-begin_snr+1)+1:1.5*kindnum_code*N_sample*(end_snr-begin_snr+1),:)=test_ypsk;
test_y(1.5*kindnum_code*N_sample*(end_snr-begin_snr+1)+1:2*kindnum_code*N_sample*(end_snr-begin_snr+1),:)=test_yqam;

%save x_sum.mat;
%save y_sum.mat;
save train_x.mat;
save test_x.mat;
save train_y.mat;
save test_y.mat;