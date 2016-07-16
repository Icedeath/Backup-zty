function [E1,E2,E3,E4,E5]=featurexb_extraction(yr)

%5尺度小波分解
[c,l]=wavedec(yr,5,'db3');
cd1=detcoef(c,l,1);  
cd2=detcoef(c,l,2);
cd3=detcoef(c,l,3);
cd4=detcoef(c,l,4);
cd5=detcoef(c,l,5);

%细节能量值特征
E1=sum(cd1.^2);
E2=sum(cd2.^2);
E3=sum(cd3.^2);
E4=sum(cd4.^2);
E5=sum(cd5.^2);




% N = length(yr);
% [h0, h1] = wfilters('db3','d');
% ta = yr';
% level=5;
% for i = 1:level;                % 逐层分解
%     td = conv(ta,h1);
%     ta = conv(ta,h0);
%     d(i,:) = wkeep(td,N);       % 使分解系数与原信号长度一致
%     h0 = dyadup(h0,0);          % 滤波器二插值
%     h1 = dyadup(h1,0);
% end
% a = wkeep(ta,N);
% E1=sum(d(1,:).^2);
% E2=sum(d(2,:).^2);
% E3=sum(d(3,:).^2);
% E4=sum(d(4,:).^2);
% E5=sum(d(5,:).^2);