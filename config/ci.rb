# Run using bin/ci

CI.run do
  step 'Setup', 'bin/setup --skip-server'

  step 'Style: Ruby', 'bin/rubocop'
  step 'Style: ERB', 'bun run erb:check'
  step 'Style: JavaScript', 'bun run lint'
  step 'Style: TypeScript', 'bun run tsc'
  step 'Style: Shell', "shellcheck $(git ls-files '*.sh')"

  step 'Lint: ERB', 'bin/herb lint'
  step 'Validate: ERB', 'bin/herb analyze .'

  step 'Security: Gem audit', 'bin/bundler-audit'
  step 'Security: JavaScript vulnerability audit', 'bun audit'
  step 'Security: Brakeman code analysis',
       'bin/brakeman --quiet --no-pager --exit-on-warn --exit-on-error'

  step 'Build: Vite assets', 'bunx vite build --mode test'
  step 'Build: JavaScript size limit', 'bun run size'

  step 'Tests: Rails', 'env PLAYWRIGHT_HEADLESS=true bin/rspec'
  step 'Tests: Seeds', 'env RAILS_ENV=test bin/rails db:seed:replant'

  # Optional: set a green GitHub commit status to unblock PR merge.
  # Requires the `gh` CLI and `gh extension install basecamp/gh-signoff`.
  # if success?
  #   step "Signoff: All systems go. Ready for merge and deploy.", "gh signoff"
  # else
  #   failure "Signoff: CI failed. Do not merge or deploy.", "Fix the issues and try again."
  # end
end
