load_data = load 'pigWordCountTest.txt' using PigStorage() as (lines:chararray);
words = FOREACH load_data GENERATE FLATTEN(TOKENIZE(lines)) as word;
grouped = GROUP words by word;
wordcount = FOREACH grouped GENERATE group , COUNT(words);
dump wordcount;
