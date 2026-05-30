set -e

bundle exec minitest tests
bundle exec rubocop --autocorrect
bundle exec bundler-audit
bundle exec brakeman . -A --no-pager --force
bundle exec reek
bundle exec flog --score
bundle exec flay --summary

echo "Looks Good To Me ... Shippit!"
