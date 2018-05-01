function f = frechet(X1,Y1,X2,Y2,varargin)

%get path point length
L1=length(X1);
L2=length(X2);



%create maxtrix forms
X1_mat=ones(L2,1)*X1';
Y1_mat=ones(L2,1)*Y1';
X2_mat=X2*ones(1,L1);
Y2_mat=Y2*ones(1,L1);

%calculate frechet distance matrix
frechet1=sqrt((X1_mat-X2_mat).^2+(Y1_mat-Y2_mat).^2);
fmin=min(frechet1(:));
fmax=max(frechet1(:));

%handle resolution
if ~isempty(varargin)
    res=varargin{1};
    if res<=0
        error('The resolution parameter must be greater than zero.')
    elseif ((fmax-fmin)/res)>10000
        warning('Given these two curves, and that resolution, this might take a while.')
    elseif res>=(fmax-fmin)
        warning('The resolution is too low given these curves to compute anything meaningful.')
        f=fmax;
        return
    end
else
    res=(fmax-fmin)/1000;
end

%compute frechet distance
for q3=fmin:res:fmax
    im1=bwlabel(frechet1<=q3);
    
    %get region number of beginning and end points
    if and(im1(1,1)~=0,im1(1,1)==im1(end,end))
        f=q3;
        break
    end
end

