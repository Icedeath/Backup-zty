function y=qam16(N_code,fc,fs,fd,Ac)
x=randi([0,15],1,N_code);
N=length(x);
nsamp=fs/fd;
for j=1:N
	 if x(j)==0
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=sqrt(1/10)*sqrt(18)*Ac*cos(2*pi*fc*(i-1)/fs+3*pi/4);
	    end
     elseif x(j)==1
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=sqrt(1/10)*sqrt(10)*Ac*cos(2*pi*fc*(i-1)/fs+2.8198);
	    end
     elseif x(j)==2
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=sqrt(1/10)*sqrt(10)*Ac*cos(2*pi*fc*(i-1)/fs-2.8198);
	    end
     elseif x(j)==3
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=sqrt(1/10)*sqrt(18)*Ac*cos(2*pi*fc*(i-1)/fs-3*pi/4);
	    end
     elseif x(j)==4
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=sqrt(1/10)*sqrt(10)*Ac*cos(2*pi*fc*(i-1)/fs+1.8925);
	    end
     elseif x(j)==5
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=sqrt(1/10)*sqrt(2)*Ac*cos(2*pi*fc*(i-1)/fs+3*pi/4);
	    end
     elseif x(j)==6
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=sqrt(1/10)*sqrt(2)*Ac*cos(2*pi*fc*(i-1)/fs-3*pi/4);
	    end
     elseif x(j)==7
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=sqrt(1/10)*sqrt(10)*Ac*cos(2*pi*fc*(i-1)/fs-1.8925);
	    end
     elseif x(j)==8
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=sqrt(1/10)*sqrt(10)*Ac*cos(2*pi*fc*(i-1)/fs+1.2490);
	    end
     elseif x(j)==9
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=sqrt(1/10)*sqrt(2)*Ac*cos(2*pi*fc*(i-1)/fs+pi/4);
	    end
     elseif x(j)==10
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=sqrt(1/10)*sqrt(2)*Ac*cos(2*pi*fc*(i-1)/fs-pi/4);
	    end
     elseif x(j)==11
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=sqrt(1/10)*sqrt(10)*Ac*cos(2*pi*fc*(i-1)/fs-1.2490);
	    end
     elseif x(j)==12
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=sqrt(1/10)*sqrt(18)*Ac*cos(2*pi*fc*(i-1)/fs+pi/4);
	    end
     elseif x(j)==13
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=sqrt(1/10)*sqrt(10)*Ac*cos(2*pi*fc*(i-1)/fs+0.3218);
	    end
     elseif x(j)==14
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=sqrt(1/10)*sqrt(10)*Ac*cos(2*pi*fc*(i-1)/fs-0.3218);
	    end
     else
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=sqrt(1/10)*sqrt(18)*Ac*cos(2*pi*fc*(i-1)/fs-pi/4);
	    end
    end
end