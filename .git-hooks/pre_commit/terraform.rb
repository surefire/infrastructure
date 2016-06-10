module Overcommit
  module Hook
    module PreCommit
      # List Terraform files whose formatting differs
      class Terraform < Base
        def run
          result = execute(command)
          output = result.stdout + result.stderr

          # Unfortunately the exit code is always 0
          return :pass if output.empty?

          extract_messages(output.split("\n"), '.*')
        end
      end
    end
  end
end
