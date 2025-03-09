
function [mon_val] = function_cycleSort_monotonicity_test(inputList)

n = length(inputList);
maxwrite=n;                   %% minwrite=0
writeCount = 0;

for cycleStart = 1:n-1

    item = inputList(cycleStart);
    pos = cycleStart;

    % Find the position where we should place the item

    for i = cycleStart+1:n
        if inputList(i) > item
            pos = pos + 1;
        end
    end

    % If the item is already in the correct position

    if pos == cycleStart
        continue;
    end

    % Skip duplicates
    while item == inputList(pos)
        pos = pos + 1;
    end

    % Put the item to its right position

    if pos ~= cycleStart
        temp = inputList(pos);
        inputList(pos) = item;
        item = temp;
        writeCount = writeCount + 1;
    end

    % Rotate the rest of the cycle

    while pos ~= cycleStart
        pos = cycleStart;

        % Find the position to place the item

        for i = cycleStart+1:n
            if inputList(i) > item
                pos = pos + 1;
            end
        end

        % Skip duplicates
        while item == inputList(pos)
            pos = pos + 1;
        end

        % Place the item at the right position

        if item ~= inputList(pos)
            temp = inputList(pos);
            inputList(pos) = item;
            item = temp;
            writeCount = writeCount + 1;
        end
    end
end

% sortedList = inputList;
mon_val=(maxwrite-writeCount)/maxwrite;

end