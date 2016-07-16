function y_sum=Signal_g(fc,fs,fd,freqsep,df,dalpha,Ac,N_code,N_sample,N_fe,begin_snr,end_snr,kindnum_code,num_code)

y_sum=zeros(((num_code-1)*kindnum_code+1)*N_sample*(end_snr-begin_snr+1),N_code*fs/fd);
y2ask=zeros(N_sample,N_code*fs/fd);
y4ask=zeros(N_sample,N_code*fs/fd);
y8ask=zeros(N_sample,N_code*fs/fd);
y2ask_sum=zeros(N_sample*(end_snr-begin_snr+1),N_code*fs/fd);   
y4ask_sum=zeros(N_sample*(end_snr-begin_snr+1),N_code*fs/fd);     
y8ask_sum=zeros(N_sample*(end_snr-begin_snr+1),N_code*fs/fd);
yask_sum=zeros(kindnum_code*N_sample*(end_snr-begin_snr+1),N_code*fs/fd);
for snr=begin_snr:end_snr  
    for num_sample=1:N_sample    
         y=ask2(N_code,fc,fs,fd,Ac);%���һ��2ask�ź�
         yr=awgn(y,snr,'measured','db');%����ɵ�2ask�ź��м���ָ������ȵ�����
         y2ask(num_sample,:)=yr;%���ƶ�����ȵ��ź����и��Ƹ�y2ask�źž���
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
   y2ask_sum((snr-begin_snr)*N_sample+1:(snr-begin_snr+1)*N_sample,:)=y2ask;%ָ������ȵ�2ask�źŸ��Ƹ�y2ask_sum�źž���
   y4ask_sum((snr-begin_snr)*N_sample+1:(snr-begin_snr+1)*N_sample,:)=y4ask;
   y8ask_sum((snr-begin_snr)*N_sample+1:(snr-begin_snr+1)*N_sample,:)=y8ask;
end
yask_sum(1:N_sample*(end_snr-begin_snr+1),:)=y2ask_sum;%��3���ǰ�ָ���������汸��2 4 8ask�źŷ���һ��������
yask_sum(N_sample*(end_snr-begin_snr+1)+1:2*N_sample*(end_snr-begin_snr+1),:)=y4ask_sum;
yask_sum(2*N_sample*(end_snr-begin_snr+1)+1:3*N_sample*(end_snr-begin_snr+1),:)=y8ask_sum;

y2fsk=zeros(N_sample,N_code*fs/fd);
y4fsk=zeros(N_sample,N_code*fs/fd);
y8fsk=zeros(N_sample,N_code*fs/fd);
y2fsk_sum=zeros(N_sample*(end_snr-begin_snr+1),N_code*fs/fd);   
y4fsk_sum=zeros(N_sample*(end_snr-begin_snr+1),N_code*fs/fd);     
y8fsk_sum=zeros(N_sample*(end_snr-begin_snr+1),N_code*fs/fd);
yfsk_sum=zeros(kindnum_code*N_sample*(end_snr-begin_snr+1),N_code*fs/fd);
for snr=begin_snr:end_snr  
    for num_sample=1:N_sample    
         y=fsk2(N_code,fc,fs,fd,freqsep,Ac);%���һ��2fsk�ź�
         yr=awgn(y,snr,'measured','db');%����ɵ�2fsk�ź��м���ָ������ȵ�����
         y2fsk(num_sample,:)=yr;%���ƶ�����ȵ��ź����и��Ƹ�y2fsk�źž���
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
   y2fsk_sum((snr-begin_snr)*N_sample+1:(snr-begin_snr+1)*N_sample,:)=y2fsk;%ָ������ȵ�2fsk�źŸ��Ƹ�y2fsk_sum�źž���
   y4fsk_sum((snr-begin_snr)*N_sample+1:(snr-begin_snr+1)*N_sample,:)=y4fsk;
   y8fsk_sum((snr-begin_snr)*N_sample+1:(snr-begin_snr+1)*N_sample,:)=y8fsk;
end
yfsk_sum(1:N_sample*(end_snr-begin_snr+1),:)=y2fsk_sum;%��3���ǰ�ָ���������汸��2 4 8fsk�źŷ���һ��������
yfsk_sum(N_sample*(end_snr-begin_snr+1)+1:2*N_sample*(end_snr-begin_snr+1),:)=y4fsk_sum;
yfsk_sum(2*N_sample*(end_snr-begin_snr+1)+1:3*N_sample*(end_snr-begin_snr+1),:)=y8fsk_sum;

y2psk=zeros(N_sample,N_code*fs/fd);
y4psk=zeros(N_sample,N_code*fs/fd);
y8psk=zeros(N_sample,N_code*fs/fd);
y2psk_sum=zeros(N_sample*(end_snr-begin_snr+1),N_code*fs/fd);   
y4psk_sum=zeros(N_sample*(end_snr-begin_snr+1),N_code*fs/fd);     
y8psk_sum=zeros(N_sample*(end_snr-begin_snr+1),N_code*fs/fd);
ypsk_sum=zeros(kindnum_code*N_sample*(end_snr-begin_snr+1),N_code*fs/fd);
for snr=begin_snr:end_snr  
    for num_sample=1:N_sample    
         y=psk2(N_code,fc,fs,fd,Ac);%���һ��2psk�ź�
         yr=awgn(y,snr,'measured','db');%����ɵ�2psk�ź��м���ָ������ȵ�����
         y2psk(num_sample,:)=yr;%���ƶ�����ȵ��ź����и��Ƹ�y2psk�źž���
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
   y2psk_sum((snr-begin_snr)*N_sample+1:(snr-begin_snr+1)*N_sample,:)=y2psk;%ָ������ȵ�2psk�źŸ��Ƹ�y2psk_sum�źž���
   y4psk_sum((snr-begin_snr)*N_sample+1:(snr-begin_snr+1)*N_sample,:)=y4psk;
   y8psk_sum((snr-begin_snr)*N_sample+1:(snr-begin_snr+1)*N_sample,:)=y8psk;
end

ypsk_sum(1:N_sample*(end_snr-begin_snr+1),:)=y2psk_sum;%��3���ǰ�ָ���������汸��2 4 8psk�źŷ���һ��������
ypsk_sum(N_sample*(end_snr-begin_snr+1)+1:2*N_sample*(end_snr-begin_snr+1),:)=y4psk_sum;
ypsk_sum(2*N_sample*(end_snr-begin_snr+1)+1:3*N_sample*(end_snr-begin_snr+1),:)=y8psk_sum;

yqam16=zeros(N_sample,N_code*fs/fd);
%qam16_sum=zeros(N_sample*(end_snr-begin_snr+1),N_code*100);   
yqam_sum=zeros(N_sample*(end_snr-begin_snr+1),N_code*fs/fd);
for snr=begin_snr:end_snr  
    for num_sample=1:N_sample   
         y=qam16(N_code,fc,fs,fd,Ac);%���һ��qam�ź�
         yr=awgn(y,snr,'measured','db');%����ɵ�qam�ź��м���ָ������ȵ�����
         yqam16(num_sample,:)=yr;%���ƶ�����ȵ��ź����и��Ƹ�qam�źž���
    end
   yqam_sum((snr-begin_snr)*N_sample+1:(snr-begin_snr+1)*N_sample,:)=yqam16;%ָ������ȵ�qam�źŸ��Ƹ�yqam_sum�źž���
end

y_sum(1:3*N_sample*(end_snr-begin_snr+1),:)=yask_sum;%��4���źŷ���һ��������
y_sum(3*N_sample*(end_snr-begin_snr+1)+1:2*3*N_sample*(end_snr-begin_snr+1),:)=yfsk_sum;
y_sum(2*3*N_sample*(end_snr-begin_snr+1)+1:3*3*N_sample*(end_snr-begin_snr+1),:)=ypsk_sum;
y_sum(3*3*N_sample*(end_snr-begin_snr+1)+1:3*3*N_sample*(end_snr-begin_snr+1)+N_sample*(end_snr-begin_snr+1),:)=yqam_sum;


