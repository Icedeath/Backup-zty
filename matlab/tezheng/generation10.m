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
N_sample=400;%ѵ��������
N_sample_test=N_sample/2;%����������Ϊѵ��������һ��
N_fe=27;%������
begin_snr=10;%��ʼ�����
end_snr=10;%��ֹ�����
kindnum_code=3;%ÿ�ֱ��������
num_code=4;%һ�����õı�������
%x_sum=zeros(num_code*kindnum_code*N_sample*(end_snr-begin_snr+1)*3/2,N_code*100);
train_x=Signal_g10(fc,fs,fd,freqsep,df,dalpha,Ac,N_code,N_sample,N_fe,begin_snr,end_snr,kindnum_code,num_code);
test_x=Signal_g10(fc,fs,fd,freqsep,df,dalpha,Ac,N_code,N_sample_test,N_fe,begin_snr,end_snr,kindnum_code,num_code);
%x_sum(1:num_code*kindnum_code*N_sample*(end_snr-begin_snr+1),:)=train_x;
%x_sum(num_code*kindnum_code*N_sample*(end_snr-begin_snr+1)+1:num_code*kindnum_code*N_sample*(end_snr-begin_snr+1)*3/2,:)=test_x;

%��ǩΪ
%2ask�ź�Ϊ0000000001,4ask�ź�Ϊ0000000010,8ask�ź�Ϊ0000000100��
%2fsk�ź�Ϊ0000001000,4fsk�ź�Ϊ0000010000��8fsk�ź�Ϊ0000100000��
%2psk�ź�Ϊ0001000000,4psk�ź�Ϊ0010000000��8psk�ź�Ϊ0100000000
%qam�ź�Ϊ1000000000,���������������λѵ����һ��
%����10���źţ���˱�ǩΪ10��
temp_a=size(train_x,1);%temp_aΪtrain_x��������ʹѵ��y��x���������
train_y=zeros(temp_a,10);
temp_b=size(test_x,1);
test_y=zeros(temp_b,10);
y2ask=ones(N_sample*(end_snr-begin_snr+1),1)*[0 0 0 0 0 0 0 0 0 1];
y4ask=ones(N_sample*(end_snr-begin_snr+1),1)*[0 0 0 0 0 0 0 0 1 0];
y8ask=ones(N_sample*(end_snr-begin_snr+1),1)*[0 0 0 0 0 0 0 1 0 0];
y2fsk=ones(N_sample*(end_snr-begin_snr+1),1)*[0 0 0 0 0 0 1 0 0 0];
y4fsk=ones(N_sample*(end_snr-begin_snr+1),1)*[0 0 0 0 0 1 0 0 0 0];
y8fsk=ones(N_sample*(end_snr-begin_snr+1),1)*[0 0 0 0 1 0 0 0 0 0];
y2psk=ones(N_sample*(end_snr-begin_snr+1),1)*[0 0 0 1 0 0 0 0 0 0];
y4psk=ones(N_sample*(end_snr-begin_snr+1),1)*[0 0 1 0 0 0 0 0 0 0];
y8psk=ones(N_sample*(end_snr-begin_snr+1),1)*[0 1 0 0 0 0 0 0 0 0];
yqam=ones(N_sample*(end_snr-begin_snr+1),1)*[1 0 0 0 0 0 0 0 0 0];
test_y2ask=ones(N_sample*(end_snr-begin_snr+1)/2,1)*[0 0 0 0 0 0 0 0 0 1];
test_y4ask=ones(N_sample*(end_snr-begin_snr+1)/2,1)*[0 0 0 0 0 0 0 0 1 0];
test_y8ask=ones(N_sample*(end_snr-begin_snr+1)/2,1)*[0 0 0 0 0 0 0 1 0 0];
test_y2fsk=ones(N_sample*(end_snr-begin_snr+1)/2,1)*[0 0 0 0 0 0 1 0 0 0];
test_y4fsk=ones(N_sample*(end_snr-begin_snr+1)/2,1)*[0 0 0 0 0 1 0 0 0 0];
test_y8fsk=ones(N_sample*(end_snr-begin_snr+1)/2,1)*[0 0 0 0 1 0 0 0 0 0];
test_y2psk=ones(N_sample*(end_snr-begin_snr+1)/2,1)*[0 0 0 1 0 0 0 0 0 0];
test_y4psk=ones(N_sample*(end_snr-begin_snr+1)/2,1)*[0 0 1 0 0 0 0 0 0 0];
test_y8psk=ones(N_sample*(end_snr-begin_snr+1)/2,1)*[0 1 0 0 0 0 0 0 0 0];
test_yqam=ones(N_sample*(end_snr-begin_snr+1)/2,1)*[1 0 0 0 0 0 0 0 0 0];
train_y=[y2ask' y4ask' y8ask' y2fsk' y4fsk' y8fsk' y2psk' y4psk' y8psk' yqam'];
train_y=train_y';
test_y=[test_y2ask' test_y4ask' test_y8ask' test_y2fsk' test_y4fsk' test_y8fsk' test_y2psk' test_y4psk' test_y8psk' test_yqam'];
test_y=test_y';

%save x_sum.mat;
%save y_sum.mat;
save train_x.mat;
save test_x.mat;
save train_y.mat;
save test_y.mat;