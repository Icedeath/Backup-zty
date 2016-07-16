clear all;
clc;

fc=500;%�ز�Ƶ��
fs=800;%����Ƶ��
fd=10;%������
freqsep=10;%Ƶƫ
df=25;%Ƶ�ʷֱ���
dalpha=0.25;%ѭ��Ƶ�ʷֱ���
Ac=1;%���
N_code=15;%��Ԫ����6
N_sample=2000;%ѵ��������
N_sample_test=N_sample/2;%����������Ϊѵ��������һ��
N_fe=27;%������
begin_snr=15;%��ʼ�����
end_snr=15;%��ֹ�����
kindnum_code=3;%ÿ�ֱ��������
num_code=4;%һ�����õı�������
%x_sum=zeros(num_code*kindnum_code*N_sample*(end_snr-begin_snr+1)*3/2,N_code*100);
train_x=Signal_g10(fc,fs,fd,freqsep,df,dalpha,Ac,N_code,N_sample,N_fe,begin_snr,end_snr,kindnum_code,num_code);
test_x=Signal_g10(fc,fs,fd,freqsep,df,dalpha,Ac,N_code,N_sample_test,N_fe,begin_snr,end_snr,kindnum_code,num_code);
%x_sum(1:num_code*kindnum_code*N_sample*(end_snr-begin_snr+1),:)=train_x;
%x_sum(num_code*kindnum_code*N_sample*(end_snr-begin_snr+1)+1:num_code*kindnum_code*N_sample*(end_snr-begin_snr+1)*3/2,:)=test_x;

temp_a=size(train_x,1);%temp_aΪtrain_x��������ʹѵ��y��x���������
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
test_y2ask=ones(N_sample*(end_snr-begin_snr+1)/2,1)*[1];
test_y4ask=ones(N_sample*(end_snr-begin_snr+1)/2,1)*[2];
test_y8ask=ones(N_sample*(end_snr-begin_snr+1)/2,1)*[3];
test_y2fsk=ones(N_sample*(end_snr-begin_snr+1)/2,1)*[4];
test_y4fsk=ones(N_sample*(end_snr-begin_snr+1)/2,1)*[5];
test_y8fsk=ones(N_sample*(end_snr-begin_snr+1)/2,1)*[6];
test_y2psk=ones(N_sample*(end_snr-begin_snr+1)/2,1)*[7];
test_y4psk=ones(N_sample*(end_snr-begin_snr+1)/2,1)*[8];
test_y8psk=ones(N_sample*(end_snr-begin_snr+1)/2,1)*[9];
test_yqam=ones(N_sample*(end_snr-begin_snr+1)/2,1)*[10];
train_y=[y2ask' y4ask' y8ask' y2fsk' y4fsk' y8fsk' y2psk' y4psk' y8psk' yqam'];
train_y=train_y';
test_y=[test_y2ask' test_y4ask' test_y8ask' test_y2fsk' test_y4fsk' test_y8fsk' test_y2psk' test_y4psk' test_y8psk' test_yqam'];
test_y=test_y';

temp_y=train_y;
train_y=test_y;
test_y=temp_y;

N=2048;
Fs=2048;
trainf_x=zeros(N_sample_test,N/2);
testf_x=zeros(N_sample,N/2);
for i=1:1:size(test_x)

temp_x=test_x(i,:);
%plot(temp_x);
%title('ԭʼ�ź�');
%figure;
Y = fft(temp_x,N); %��FFT�任
Ayy = (abs(Y)); %ȡģ
%plot(Ayy(1:N)); %��ʾԭʼ��FFTģֵ���
%title('FFT ģֵ');
%figure;
Ayy=Ayy/(N/2);   %�����ʵ�ʵķ���
Ayy(1)=Ayy(1)/2; %ֱ������ͬ������
F=([1:N]-1)*Fs/N; %�����ʵ�ʵ�Ƶ��ֵ ,��ͬ��F=(0:N)*Fs/N;
%plot(F(1:N/2),Ayy(1:N/2));   %��ʾ������FFTģֵ���
%title('����-Ƶ������ͼ');

trainf_x(i,:)=Ayy(1:N/2);
end

for i=1:1:size(train_x)

temp_x=train_x(i,:);
%plot(temp_x);
%title('ԭʼ�ź�');
%figure;
Y = fft(temp_x,N); %��FFT�任
Ayy = (abs(Y)); %ȡģ
%plot(Ayy(1:N)); %��ʾԭʼ��FFTģֵ���
%title('FFT ģֵ');
%figure;
Ayy=Ayy/(N/2);   %�����ʵ�ʵķ���
Ayy(1)=Ayy(1)/2; %ֱ������ͬ������
F=([1:N]-1)*Fs/N; %�����ʵ�ʵ�Ƶ��ֵ ,��ͬ��F=(0:N)*Fs/N;
%plot(F(1:N/2),Ayy(1:N/2));   %��ʾ������FFTģֵ���
%title('����-Ƶ������ͼ');

testf_x(i,:)=Ayy(1:N/2);
end
%��һ��
train_x=mapminmax(trainf_x,0,1);
test_x = mapminmax(testf_x, 0, 1);
testf_y=train_y;
trainf_y=test_y;
%����Ϊһ��cell
datasets=cell(2,2);
train_x=mapminmax(train_x,0,1);
test_x=mapminmax(test_x,0,1);

datasets{1,1}=train_x;
datasets{1,2}=train_y;
datasets{2,1}=test_x;
datasets{2,2}=test_y;
save datasetsf_15_1024 datasets;
