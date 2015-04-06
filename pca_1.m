
function [r]= pca_1(a)
%takes a matrix as a input
%   Detailed explanation goes here
    % a=[1 2 3; 4 5 6; 7 8 9];
    a = [269.8 38.9 50.5
272.4 39.5 50.0
270.0 38.9 50.5
272.0 39.3 50.2
269.8 38.9 50.5
269.8 38.9 50.5
268.2 38.6 50.2
268.2 38.6 50.8
267.0 38.2 51.1
267.8 38.4 51.0
273.6 39.6 50.0
271.2 39.1 50.4
269.8 38.9 50.5
270.0 38.9 50.5
270.0 38.9 50.5
];
    display(' data matrix');
    disp(a);
    disp('dimension of the matrix');
    [m n]= size(a); %calculate the dimension of data matrix
    
    a_mean = mean(a);
    display('The mean matrix');
    disp(a_mean); %display the mean matrix
    disp('Standard Diavation of matrix');
    a_std= std(a);
    % the first step in PCA is to standardize the data.
    %Here, "standardization" means subtracting the sample mean from each observation,
    %then dividing by the sample standard deviation.
    %This centers and scales the data.
    disp(a_std);
    disp('Standarised matrix');
    b = (a - repmat(a_mean,[m 1])) ./ repmat(a_std,[m 1]);
    % B = zscore(A) is alternate way to calculate standarised matrix
    disp(b); %display the Standarised matrix

    %Calculating the coefficients of the principal components and 
    %their respective variances is done by finding the eigenfunctions of the sample covariance matrix:
    disp('%Calculating the coefficients of the principal components');
    [V D] = eig(cov(b));
    %display coefficent matrix contains principal components
    disp('coefficent matrix contains principal components');
    disp(V);
    coefforth=V;
    %display variance of the respective principal component
    disp(' variance of the respective principal component');
    disp(D);
    disp('the diagonal variance matrix');
    s =diag(D);
    disp(s);
    disp('the resultant principal component is ');
    %here, first pc is appear at the last column because of using eig function
    r= b*V;
   % disp(r);
   
   
   figure();
biplot(coefforth(:,1:3),'scores',b(:,1:3));
axis([-.26 .80 -.51 .51 -.61 .81]);
view([30 40]);
end
