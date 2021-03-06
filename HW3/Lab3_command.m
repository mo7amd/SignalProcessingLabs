function Lab3_command()
%   original signal
    t=linspace(-2,4,6000);
    x=4*sin(pi*t).*exp(-0.4*t);
%    time shift by 2 sec 
    x1=[zeros(1,2000) x(1:4000)];
    x2=[x(4001:end) x(1:4000)];
%     time scaling (scale up)
    t3=linspace(-4,8,12000);
    x3=resample(x,2,1);
%     time compresion (scaling down)
    t4=linspace(-1/2,1,1500);
    x4=downsample(x,4);
%     reverse the signal
    t5=linspace(-4,2,6000);
    x5=x(end:-1:1);
%     *********** plot section ***************
    subplot(3,2,1);
    plot(t,x);
    subplot(3,2,2);
    plot(t,x1);
    subplot(3,2,3);
    plot(t,x2);
    subplot(3,2,4);
    plot(t3,x3);
    subplot(3,2,5);
    plot(t4,x4);
    subplot(3,2,6);
    plot(t5,x5);
%     *************End of section*************
% convolution method using inpulse response :
    h=[1 2 2];
    X=[1:4];
    y=conv(X,h);
    n=linspace(0,5,6);
    figure;
    subplot(2,1,1);
    plot(n,y);
    subplot(2,1,2);
    stem(n,y);
%     ***************************************
% generateing random numbers: 
%     magic > generate from 1 to 9
%     random , randn 
%     *************from 31 to 36 ************
%     *****************clipping**************
    t=linspace(0,4,400);
    x=5*sin(2*pi*t);
    I1=find(x>3);
    x(I1)=3;
    I1=find(x<-4);
    x(I1)=-4;
    figure;
    plot(t,x);
%     **********form 37 to 41 **************
%     **********half wave rectfier**********
    t=linspace(0,4,400);
    x=3*sin(2*pi*t);
    x1=x;
    x1(find(x1<0))=0;
    x2=x.*(x>0);
    figure;
    plot(t,x2);
%     ********from 42 to 44 ***************
% *************full wave rectfier**********
    t=linspace(0,4,400);
    x=3*sin(2*pi*t);
    x1=abs(x);
    figure;
    plot(t,x1);
end