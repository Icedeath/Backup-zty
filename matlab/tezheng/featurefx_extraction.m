function [D_B,D_I]=featurefx_extraction(yr)

for i=1:(length(yr)-1)
    lambda1(i)=abs(yr(i)-yr(i+1));
end
d_lambda1=sum(lambda1);
I1=(-(lambda1/d_lambda1)).*(log10(lambda1/d_lambda1));
I_lambda1=sum(I1);

for j=1:(floor((length(yr)+1)/2)-1)
    lambda2(j)=max([yr(2*j-1) yr(2*j) yr(2*j+1)])-min([yr(2*j-1) yr(2*j) yr(2*j+1)]);
end
d_lambda2=sum(lambda2);
I2=(-(lambda2/d_lambda2)).*(log10(lambda2/d_lambda2));
I_lambda2=sum(I2);

%盒维数
D_B=log10(2*d_lambda1/d_lambda2)/log10(2);

%信息维数
D_I=(I_lambda1-I_lambda2)/log10(2);