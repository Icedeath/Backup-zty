

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
fc=7e7;%载波频率
fs=2e8;%采样频率
fd=2e6;%码速率
freqsep=1e6;%频偏
df=25e5;%频率分辨率
dalpha=0.25e5;%循环频率分辨率
Ac=1;%振幅
N_code=15;%码元个数
N_sample=90;%样本数
N_fe=27;%特征数
begin_snr=5;%起始信噪比
end_snr=10;%终止信噪比
kindnum_code=3;%每种编码的种类
num_code=4;%一共采用的编码种类
yqam16=zeros(N_sample,N_code*100);
%qam16_sum=zeros(N_sample*(end_snr-begin_snr+1),N_code*100);   
yqam_sum=zeros(N_sample*(end_snr-begin_snr+1),N_code*100);
for snr=begin_snr:end_snr  
    for num_sample=1:N_sample   
         y=qam16(N_code,fc,fs,fd,Ac);%生成一个qam信号
         yr=awgn(y,snr,'measured','db');%在生成的qam信号中加入指定信噪比的噪声
         yqam16(num_sample,:)=yr;%将制定信噪比的信号逐行复制给qam信号矩阵
    end
   yqam_sum((snr-begin_snr)*N_sample+1:(snr-begin_snr+1)*N_sample,:)=yqam16;%指定信噪比的qam信号复制给yqam_sum信号矩阵
end