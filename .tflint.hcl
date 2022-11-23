config {
  module = true
  force = false
  disabled_by_default = true´
}

plugin "aws" {
  enabled = true
  deep_check = false
}

# Require specific tags for all AWS resource types that support them.
# Ensure required billing tags
rule "aws_resource_missing_tags" {
  enabled = false
  tags = ["Env", "System", "SubSystem", "Team", "CreationOrigin", "Repository", "State"]
}


# Disallow // comments in favor of #.
rule "terraform_comment_syntax" {
  enabled = true
}

# Disallow legacy dot index syntax.
rule "terraform_deprecated_index" {
  enabled = true
}

# Disallow deprecated (0.11-style) interpolation.
rule "terraform_deprecated_interpolation" {
  enabled = true
}

# Disallow output declarations without description.
rule "terraform_documented_outputs" {
  enabled = false
}

# Disallow variable declarations without description.
rule "terraform_documented_variables" {
  enabled = true
}

# Disallow specifying a git or mercurial repository as a module source without pinning to a version.
rule "terraform_module_pinned_source" {
  enabled = true
  style = "semver" # flexible (allows branch name), semver (only semantic version)
}

# Enforces naming conventions
rule "terraform_naming_convention" {
  enabled = true
  format = "snake_case"
}

# Require that all providers have version constraints through required_providers.
rule "terraform_required_providers" {
  enabled = true
}

# Disallow terraform declarations without require_version.
rule "terraform_required_version" {
  enabled = true
}

# Ensure that a module complies with the Terraform Standard Module Structure
rule "terraform_standard_module_structure" {
  enabled = false
}

# Disallow variable declarations without type.
rule "terraform_typed_variables" {
  enabled = true
}

# Disallow variables, data sources, and locals that are declared but never used.
rule "terraform_unused_declarations" {
  enabled = false
}
