clear all;
clc;

fc=7e7;%载波频率
fs=2e8;%采样频率
fd=2e6;%码速率
freqsep=1e6;%频偏
df=25e5;%频率分辨率
dalpha=0.25e5;%循环频率分辨率
Ac=1;%振幅
N_code=10;%码元个数6
N_sample=400;%训练样本数
N_sample_test=N_sample/2;%测试样本数为训练样本的一半
N_fe=27;%特征数
begin_snr=10;%起始信噪比
end_snr=10;%终止信噪比
kindnum_code=3;%每种编码的种类
num_code=4;%一共采用的编码种类
%x_sum=zeros(num_code*kindnum_code*N_sample*(end_snr-begin_snr+1)*3/2,N_code*100);
train_x=Signal_g10(fc,fs,fd,freqsep,df,dalpha,Ac,N_code,N_sample,N_fe,begin_snr,end_snr,kindnum_code,num_code);
test_x=Signal_g10(fc,fs,fd,freqsep,df,dalpha,Ac,N_code,N_sample_test,N_fe,begin_snr,end_snr,kindnum_code,num_code);
%x_sum(1:num_code*kindnum_code*N_sample*(end_snr-begin_snr+1),:)=train_x;
%x_sum(num_code*kindnum_code*N_sample*(end_snr-begin_snr+1)+1:num_code*kindnum_code*N_sample*(end_snr-begin_snr+1)*3/2,:)=test_x;

%标签为
%2ask信号为0000000001,4ask信号为0000000010,8ask信号为0000000100，
%2fsk信号为0000001000,4fsk信号为0000010000，8fsk信号为0000100000，
%2psk信号为0001000000,4psk信号为0010000000，8psk信号为0100000000
%qam信号为1000000000,在这里测试样本数位训练的一半
%共有10种信号，因此标签为10列
temp_a=size(train_x,1);%temp_a为train_x的行数，使训练y和x的行数相等
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