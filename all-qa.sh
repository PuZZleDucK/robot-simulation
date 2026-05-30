set -e

echo ":: Tests"
bundle exec minitest tests
echo ":: Rubocop"
bundle exec rubocop --autocorrect
echo ":: Audit"
bundle exec bundler-audit
echo ":: Brakeman"
bundle exec brakeman . -A --no-pager --force
echo ":: Reek"
bundle exec reek
echo ":: Flog"
bundle exec flog --score
echo ":: Flay"
bundle exec flay --summary

echo ""
echo "Looks Good To Me ... Shippit!"
