function y_sum=Signal_g(fc,fs,fd,freqsep,df,dalpha,Ac,N_code,N_sample,N_fe,begin_snr,end_snr,kindnum_code,num_code)
%close all;
%clear all;
%clc;

%fc=7e7;%载波频率
%fs=2e8;%采样频率
%fd=2e6;%码速率
%freqsep=1e6;%频偏
%df=25e5;%频率分辨率
%dalpha=0.25e5;%循环频率分辨率
%Ac=1;%振幅
%N_code=15;%码元个数
%N_sample=90;%样本数
%N_fe=27;%特征数
%begin_snr=5;%起始信噪比
%end_snr=10;%终止信噪比
%kindnum_code=3;%每种编码的种类
%num_code=4;%一共采用的编码种类
y_sum=zeros(num_code*kindnum_code*N_sample*(end_snr-begin_snr+1),N_code*100);
y2ask=zeros(N_sample,N_code*100);
y4ask=zeros(N_sample,N_code*100);
y8ask=zeros(N_sample,N_code*100);
y2ask_sum=zeros(N_sample*(end_snr-begin_snr+1),N_code*100);   
y4ask_sum=zeros(N_sample*(end_snr-begin_snr+1),N_code*100);     
y8ask_sum=zeros(N_sample*(end_snr-begin_snr+1),N_code*100);
yask_sum=zeros(kindnum_code*N_sample*(end_snr-begin_snr+1),N_code*100);
for snr=begin_snr:end_snr  
    for num_sample=1:N_sample    
         y=ask2(N_code,fc,fs,fd,Ac);%生成一个2ask信号
         yr=awgn(y,snr,'measured','db');%在生成的2ask信号中加入指定信噪比的噪声
         y2ask(num_sample,:)=yr;%将制定信噪比的信号逐行复制给y2ask信号矩阵
    end
    for num_sample=1:N_sample    
         y=ask4(N_code,fc,fs,fd,Ac);
         yr=awgn(y,snr,'measured','db');
         y4ask(num_sample,:)=yr;
    end
    for num_sample=1:N_sample
         y=ask8(N_code,fc,fs,fd,Ac);
         yr=awgn(y,snr,'measured','db');
         y8ask(num_sample,:)=yr;
    end
   y2ask_sum((snr-begin_snr)*N_sample+1:(snr-begin_snr+1)*N_sample,:)=y2ask;%指定信噪比的2ask信号复制给y2ask_sum信号矩阵
   y4ask_sum((snr-begin_snr)*N_sample+1:(snr-begin_snr+1)*N_sample,:)=y4ask;
   y8ask_sum((snr-begin_snr)*N_sample+1:(snr-begin_snr+1)*N_sample,:)=y8ask;
end
yask_sum(1:N_sample*(end_snr-begin_snr+1),:)=y2ask_sum;%这3行是吧指定信噪比区兼备的2 4 8ask信号放入一个矩阵中
yask_sum(N_sample*(end_snr-begin_snr+1)+1:2*N_sample*(end_snr-begin_snr+1),:)=y4ask_sum;
yask_sum(2*N_sample*(end_snr-begin_snr+1)+1:3*N_sample*(end_snr-begin_snr+1),:)=y8ask_sum;

y2fsk=zeros(N_sample,N_code*100);
y4fsk=zeros(N_sample,N_code*100);
y8fsk=zeros(N_sample,N_code*100);
y2fsk_sum=zeros(N_sample*(end_snr-begin_snr+1),N_code*100);   
y4fsk_sum=zeros(N_sample*(end_snr-begin_snr+1),N_code*100);     
y8fsk_sum=zeros(N_sample*(end_snr-begin_snr+1),N_code*100);
yfsk_sum=zeros(kindnum_code*N_sample*(end_snr-begin_snr+1),N_code*100);
for snr=begin_snr:end_snr  
    for num_sample=1:N_sample    
         y=fsk2(N_code,fc,fs,fd,freqsep,Ac);%生成一个2fsk信号
         yr=awgn(y,snr,'measured','db');%在生成的2fsk信号中加入指定信噪比的噪声
         y2fsk(num_sample,:)=yr;%将制定信噪比的信号逐行复制给y2fsk信号矩阵
    end
    for num_sample=1:N_sample    
         y=fsk4(N_code,fc,fs,fd,freqsep,Ac);
         yr=awgn(y,snr,'measured','db');
         y4fsk(num_sample,:)=yr;
    end
    for num_sample=1:N_sample
         y=fsk2(N_code,fc,fs,fd,freqsep,Ac);
         yr=awgn(y,snr,'measured','db');
         y8fsk(num_sample,:)=yr;
    end
   y2fsk_sum((snr-begin_snr)*N_sample+1:(snr-begin_snr+1)*N_sample,:)=y2fsk;%指定信噪比的2fsk信号复制给y2fsk_sum信号矩阵
   y4fsk_sum((snr-begin_snr)*N_sample+1:(snr-begin_snr+1)*N_sample,:)=y4fsk;
   y8fsk_sum((snr-begin_snr)*N_sample+1:(snr-begin_snr+1)*N_sample,:)=y8fsk;
end
yfsk_sum(1:N_sample*(end_snr-begin_snr+1),:)=y2fsk_sum;%这3行是吧指定信噪比区兼备的2 4 8fsk信号放入一个矩阵中
yfsk_sum(N_sample*(end_snr-begin_snr+1)+1:2*N_sample*(end_snr-begin_snr+1),:)=y4fsk_sum;
yfsk_sum(2*N_sample*(end_snr-begin_snr+1)+1:3*N_sample*(end_snr-begin_snr+1),:)=y8fsk_sum;

y2psk=zeros(N_sample,N_code*100);
y4psk=zeros(N_sample,N_code*100);
y8psk=zeros(N_sample,N_code*100);
y2psk_sum=zeros(N_sample*(end_snr-begin_snr+1),N_code*100);   
y4psk_sum=zeros(N_sample*(end_snr-begin_snr+1),N_code*100);     
y8psk_sum=zeros(N_sample*(end_snr-begin_snr+1),N_code*100);
ypsk_sum=zeros(kindnum_code*N_sample*(end_snr-begin_snr+1),N_code*100);
for snr=begin_snr:end_snr  
    for num_sample=1:N_sample    
         y=psk2(N_code,fc,fs,fd,Ac);%生成一个2psk信号
         yr=awgn(y,snr,'measured','db');%在生成的2psk信号中加入指定信噪比的噪声
         y2psk(num_sample,:)=yr;%将制定信噪比的信号逐行复制给y2psk信号矩阵
    end
    for num_sample=1:N_sample    
         y=psk4(N_code,fc,fs,fd,Ac);
         yr=awgn(y,snr,'measured','db');
         y4psk(num_sample,:)=yr;
    end
    for num_sample=1:N_sample
         y=psk2(N_code,fc,fs,fd,Ac);
         yr=awgn(y,snr,'measured','db');
         y8psk(num_sample,:)=yr;
    end
   y2psk_sum((snr-begin_snr)*N_sample+1:(snr-begin_snr+1)*N_sample,:)=y2psk;%指定信噪比的2psk信号复制给y2psk_sum信号矩阵
   y4psk_sum((snr-begin_snr)*N_sample+1:(snr-begin_snr+1)*N_sample,:)=y4psk;
   y8psk_sum((snr-begin_snr)*N_sample+1:(snr-begin_snr+1)*N_sample,:)=y8psk;
end

ypsk_sum(1:N_sample*(end_snr-begin_snr+1),:)=y2psk_sum;%这3行是吧指定信噪比区兼备的2 4 8psk信号放入一个矩阵中
ypsk_sum(N_sample*(end_snr-begin_snr+1)+1:2*N_sample*(end_snr-begin_snr+1),:)=y4psk_sum;
ypsk_sum(2*N_sample*(end_snr-begin_snr+1)+1:3*N_sample*(end_snr-begin_snr+1),:)=y8psk_sum;

yqam16=zeros(kindnum_code*N_sample,N_code*100);
%qam16_sum=zeros(N_sample*(end_snr-begin_snr+1),N_code*100);   
yqam_sum=zeros(kindnum_code*N_sample*(end_snr-begin_snr+1),N_code*100);
for snr=begin_snr:end_snr  
    for num_sample=1:kindnum_code*N_sample    
         y=qam16(N_code,fc,fs,fd,Ac);%生成一个qam信号
         yr=awgn(y,snr,'measured','db');%在生成的qam信号中加入指定信噪比的噪声
         yqam16(num_sample,:)=yr;%将制定信噪比的信号逐行复制给qam信号矩阵
    end
   yqam_sum(kindnum_code*(snr-begin_snr)*N_sample+1:kindnum_code*(snr-begin_snr+1)*N_sample,:)=yqam16;%指定信噪比的qam信号复制给yqam_sum信号矩阵
end

y_sum(1:3*N_sample*(end_snr-begin_snr+1),:)=yask_sum;%将4种信号放在一个矩阵中
y_sum(3*N_sample*(end_snr-begin_snr+1)+1:2*3*N_sample*(end_snr-begin_snr+1),:)=yfsk_sum;
y_sum(2*3*N_sample*(end_snr-begin_snr+1)+1:3*3*N_sample*(end_snr-begin_snr+1),:)=ypsk_sum;
y_sum(3*3*N_sample*(end_snr-begin_snr+1)+1:4*3*N_sample*(end_snr-begin_snr+1),:)=yqam_sum;

save yask_sum.mat;
save yfsk_sum.mat;
save ypsk_sum.mat;
save yqam_sum.mat;
