function [E1,E2,E3,E4,E5]=featurexb_extraction(yr)

%5�߶�С���ֽ�
[c,l]=wavedec(yr,5,'db3');
cd1=detcoef(c,l,1);  
cd2=detcoef(c,l,2);
cd3=detcoef(c,l,3);
cd4=detcoef(c,l,4);
cd5=detcoef(c,l,5);

%ϸ������ֵ����
E1=sum(cd1.^2);
E2=sum(cd2.^2);
E3=sum(cd3.^2);
E4=sum(cd4.^2);
E5=sum(cd5.^2);




% N = length(yr);
% [h0, h1] = wfilters('db3','d');
% ta = yr';
% level=5;
% for i = 1:level;                % ���ֽ�
%     td = conv(ta,h1);
%     ta = conv(ta,h0);
%     d(i,:) = wkeep(td,N);       % ʹ�ֽ�ϵ����ԭ�źų���һ��
%     h0 = dyadup(h0,0);          % �˲�������ֵ
%     h1 = dyadup(h1,0);
% end
% a = wkeep(ta,N);
% E1=sum(d(1,:).^2);
% E2=sum(d(2,:).^2);
% E3=sum(d(3,:).^2);
% E4=sum(d(4,:).^2);
% E5=sum(d(5,:).^2);