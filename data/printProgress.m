function [] = printProgress(iter, totalIter)

if iter == 1
    tic
end

if floor(iter/totalIter*100) ~= floor((iter - 1)/totalIter*100)
    currentTime = toc;
    timePer = currentTime/iter;
    totalTime = timePer*totalIter;

    fprintf('%4.1f%% Complete. %1.1f s / %1.1f s\n', iter/totalIter*100, currentTime, totalTime)
end