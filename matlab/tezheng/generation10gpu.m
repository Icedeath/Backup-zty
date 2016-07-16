clear all;
clc;

fc=7e7;
fs=2e8;
fd=2e6;
freqsep=1e6;
df=25e5;
dalpha=0.25e5;
Ac=1;
N_code=15;
N_sample=50000;
N_sample_test=N_sample/20;
N_fe=27;
begin_snr=15;
end_snr=15;
kindnum_code=3;
num_code=4;
%x_sum=zeros(num_code*kindnum_code*N_sample*(end_snr-begin_snr+1)*3/2,N_code*100);
train_x=Signal_g10(fc,fs,fd,freqsep,df,dalpha,Ac,N_code,N_sample,N_fe,begin_snr,end_snr,kindnum_code,num_code);
test_x=Signal_g10(fc,fs,fd,freqsep,df,dalpha,Ac,N_code,N_sample_test,N_fe,begin_snr,end_snr,kindnum_code,num_code);
%x_sum(1:num_code*kindnum_code*N_sample*(end_snr-begin_snr+1),:)=train_x;
%x_sum(num_code*kindnum_code*N_sample*(end_snr-begin_snr+1)+1:num_code*kindnum_code*N_sample*(end_snr-begin_snr+1)*3/2,:)=test_x;

tic;
temp_a=size(train_x,1);%temp_aΪtrain_x
train_y=zeros(temp_a,10);
temp_b=size(test_x,1);
test_y=zeros(temp_b,10);
y2ask=ones(N_sample*(end_snr-begin_snr+1),1)*[1];
y4ask=ones(N_sample*(end_snr-begin_snr+1),1)*[2];
y8ask=ones(N_sample*(end_snr-begin_snr+1),1)*[3];
y2fsk=ones(N_sample*(end_snr-begin_snr+1),1)*[4];
y4fsk=ones(N_sample*(end_snr-begin_snr+1),1)*[5];
y8fsk=ones(N_sample*(end_snr-begin_snr+1),1)*[6];
y2psk=ones(N_sample*(end_snr-begin_snr+1),1)*[7];
y4psk=ones(N_sample*(end_snr-begin_snr+1),1)*[8];
y8psk=ones(N_sample*(end_snr-begin_snr+1),1)*[9];
yqam=ones(N_sample*(end_snr-begin_snr+1),1)*[10];
test_y2ask=ones(N_sample_test*(end_snr-begin_snr+1),1)*[1];
test_y4ask=ones(N_sample_test*(end_snr-begin_snr+1),1)*[2];
test_y8ask=ones(N_sample_test*(end_snr-begin_snr+1),1)*[3];
test_y2fsk=ones(N_sample_test*(end_snr-begin_snr+1),1)*[4];
test_y4fsk=ones(N_sample_test*(end_snr-begin_snr+1),1)*[5];
test_y8fsk=ones(N_sample_test*(end_snr-begin_snr+1),1)*[6];
test_y2psk=ones(N_sample_test*(end_snr-begin_snr+1),1)*[7];
test_y4psk=ones(N_sample_test*(end_snr-begin_snr+1),1)*[8];
test_y8psk=ones(N_sample_test*(end_snr-begin_snr+1),1)*[9];
test_yqam=ones(N_sample_test*(end_snr-begin_snr+1),1)*[10];
train_y=[y2ask' y4ask' y8ask' y2fsk' y4fsk' y8fsk' y2psk' y4psk' y8psk' yqam'];
train_y=train_y';
test_y=[test_y2ask' test_y4ask' test_y8ask' test_y2fsk' test_y4fsk' test_y8fsk' test_y2psk' test_y4psk' test_y8psk' test_yqam'];
test_y=test_y';


% save train_x train_x
% save train_y train_y
% save test_x test_x
% save test_y test_y
save('signal_1500_50W','train_x','train_y','test_x','test_y','-v7.3')
toc;