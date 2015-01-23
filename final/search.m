A = zeros(1,16000);
for i = 1:16000
   if (predictRa(1,i) <= (0.3 * max(predictRa) + min(predictRa)))
     A(i) = A(i) + 1;
   end
end

for i = 1:16000
   if (PredictValueShrinkageY(1,i) <= (0.4 * max(PredictValueShrinkageY) + min(PredictValueShrinkageY)))
     A(i) = A(i) + 1;
   end
end

for i = 1:16000
   if (PredictShrinkageZValue(1,i) <= (0.3 * max(PredictShrinkageZValue) + min(PredictShrinkageZValue)))
     A(i) = A(i) + 1;
   end
end

minTimePosition = 0;
minTimeValue = 100000000;
for i = 1:16000
    if (A(i) == 3)
      if ( 13000 / parameterDatabase(1, i) ) * parameterDatabase(4, i) <= minTimeValue
         minTimePosition = i;
         minTimeValue = ( 13000 / parameterDatabase(1, i) ) * parameterDatabase(4, i);
      end
      
    end
end
 parameterDatabase(1, minTimePosition)
 parameterDatabase(2, minTimePosition)
 parameterDatabase(3, minTimePosition)
 parameterDatabase(4, minTimePosition)
 predictRa(1, minTimePosition)
 PredictShrinkageZValue(1, minTimePosition)
 PredictValueShrinkageY(1, minTimePosition)
 
 
    
        
        
        
        
        
        
        
        
        
        