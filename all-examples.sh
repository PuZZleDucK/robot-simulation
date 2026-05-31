
output1=$(bundle exec ruby src/simulate.rb < examples/example1.rob)
if [[ "$output1" == "1,0,E" ]]; then
    echo "Example 1 pass"
fi
output2=$(bundle exec ruby src/simulate.rb < examples/example2.rob)
if [[ "$output2" == "1,2,E" ]]; then
    echo "Example 2 pass"
fi

echo "All examples glob run - unchecked"
bundle exec ruby src/simulate.rb examples/*
