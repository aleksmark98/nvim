return {
   settings = {
      python = {
         -- to ensure correct imports
         -- pythonPath = vim.fn.exepath("/opt/homebrew/bin/python3"),
         exclude = { ".venv" },
         venvPath = ".",
         venv = ".venv",
         analysis = {
            typeCheckingMode = "basic",
            diagnosticRuleSet = {
               reportAbstractUsage = "warning",
               strictListInference = "warning",
               strictDictionaryInference = "warning",
               strictSetInference = "warning",
               reportDuplicateImport = "warning",
            },
         },
      },
   },
}
