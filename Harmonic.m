nx = 50;
ny = 50;
G = sparse(nx*ny,nx*ny);
for i = 1:nx
    for j = 1:ny
        n = j + (i-1)*ny;
        if i == 1
            G(n,n) = 1;
        elseif i == nx
            G(n,n) = 1;
        elseif j == 1
            G(n,n) = 1;
        elseif j == ny
            G(n,n) = 1;
        else
            nxm = j + (i-2)*ny;
            nxp = j + (i)*ny;
            nym = j-1 + (i-1)*ny;
            nyp = j+1 + (i-1)*ny;
            G(n,nxp) = 1;
            G(n,nyp) = 1;
            G(n,nxm) = 1;
            G(n,nym) = 1;
            if(i>10 && i<20 && j>10 && j<20)
                G(n,n) = -2;
            else
                G(n,n) = -4;
            end
        end
    end
end
[E,D] = eigs(G,9,'SM');
x = linspace(1,9,9);
for i = 1:9
    y(i) = D(i,i);
end
figure(1)
scatter(x,y)

%surf(E)
Emap =  zeros(nx,ny);

for k = 1:9
    
for i = 1:nx
    for j = 1:ny
        n = j + (i-1)*ny;
        Emap(i,j) = E(n,k);
    end
end
figure(k+1)
surf(Emap)
end






