# Terraform Workspace-Based POC

This project demonstrates separate state management for different teams (admin and team) using Terraform workspaces with a local backend.

## Project Structure

```
terraform-test/
├── modules/
│   └── demo-resource/       # Simple null_resource module
│       ├── main.tf          # Module implementation
│       └── outputs.tf       # Module outputs
├── config/
│   └── main.tf              # Main configuration using local backend
├── states/                  # Directory where workspace states are stored
└── README.md                # This file
```

## Module: demo-resource

A simple module that creates a `null_resource` with a name trigger. This demonstrates how resources can be managed separately per workspace.

**Inputs:**
- `name` (string): Name to use as trigger for the null resource

**Outputs:**
- `id`: The ID of the null resource

## Configuration

The `config/main.tf` file:
- Uses a local backend with `workspace_dir` pointing to `../states`
- Calls the `demo-resource` module
- Passes the current workspace name as the resource name
- Outputs the resource ID and current workspace name

## Usage Instructions

### 1. Initialize Terraform

Navigate to the config directory and initialize Terraform:

```bash
cd terraform-test/config
terraform init
```

This will set up the local backend and create the default workspace.

### 2. Create Workspaces

Create separate workspaces for admin and team:

```bash
# Create admin workspace
terraform workspace new admin

# Create team workspace
terraform workspace new team
```

### 3. List Available Workspaces

To see all available workspaces:

```bash
terraform workspace list
```

The current workspace will be marked with an asterisk (*).

### 4. Switch Between Workspaces

Switch to a specific workspace:

```bash
# Switch to admin workspace
terraform workspace select admin

# Switch to team workspace
terraform workspace select team
```

### 5. Apply Configuration

Apply the configuration in each workspace:

```bash
# Apply in admin workspace
terraform workspace select admin
terraform apply

# Apply in team workspace
terraform workspace select team
terraform apply
```

### 6. View Outputs

After applying, you can view the outputs:

```bash
terraform output
```

This will show:
- `resource_id`: The ID of the null resource
- `workspace_name`: The current workspace name

## Expected State File Locations

After running `terraform apply` in each workspace, the state files will be created in the `states/` directory:

```
terraform-test/states/
├── admin.tfstate           # State file for admin workspace
└── team.tfstate            # State file for team workspace
```

Each workspace maintains its own separate state file, allowing admin and team to manage their resources independently without conflicts.

## Verification

To verify the setup is working correctly:

1. Check that state files exist in the `states/` directory:
   ```bash
   ls -la ../states/
   ```

2. Compare the outputs between workspaces:
   ```bash
   terraform workspace select admin
   terraform output
   
   terraform workspace select team
   terraform output
   ```

   You should see different resource IDs and workspace names for each workspace.

## Benefits of This Approach

1. **Isolated State**: Each workspace has its own state file, preventing conflicts
2. **Shared Configuration**: Both workspaces use the same Terraform configuration
3. **Easy Switching**: Simple commands to switch between admin and team contexts
4. **Local Backend**: No external dependencies, perfect for POCs and testing
5. **Clear Organization**: State files are organized in a dedicated directory

## Cleanup

To destroy resources in a workspace:

```bash
# Destroy admin resources
terraform workspace select admin
terraform destroy

# Destroy team resources
terraform workspace select team
terraform destroy
```

To delete a workspace (must be empty first):

```bash
terraform workspace select default
terraform workspace delete admin
terraform workspace delete team