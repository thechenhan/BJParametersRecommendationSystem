num = 0;
for i = 1:16
    for j = 1:10
        for k = 1:10
            for g = 1:10
                num = num + 1;
                parameterDatabase(1, num) = L(1,i);
                parameterDatabase(2, num) = S(1,j);
                parameterDatabase(3, num) = P(1,k);
                parameterDatabase(4, num) = D(1,g);
            end
        end
    end
end




