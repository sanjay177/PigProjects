load_data = load 'customerSpending.txt' USING PigStorage(',') as (name:chararray,spent:int);
grouped = GROUP load_data by name;
totalSpent = FOREACH grouped GENERATE group,SUM(load_data.spent) as totalSpending;
--Sort the Record by Max to Min 
sortedOrderDesc = ORDER totalSpent by totalSpending desc;
-- Get Top 3 records
getFirst3Name = LIMIT sortedOrderDesc 3;
dump getFirst3Name;
-- Sort the record from Min to Max
sortedOrderAsc = ORDER totalSpent by totalSpending;
-- Get Top 3 Records
getLast3Name = LIMIT sortedOrderAsc 3;
dump getLast3Name;
