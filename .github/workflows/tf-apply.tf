name: Terraform Apply

on:
  workflow_dispatch:
    inputs:
      environment:
        description: 'Select the environment to deploy: (dev, staging, prod)'
        required: true
        default: 'dev'
        type: choice
        options:
          - dev
          - staging
          - prod

jobs:
  apply:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Code
        uses: actions/checkout@v4

      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v3
        with:
          terraform_version: '1.4.0'

      - name: Download Terraform Plan Artifact
        uses: actions/download-artifact@v3
        with:
          name: terraform-plan
          path: ./environments

      - name: Reinitialize Terraform
        run: |
          echo "## Reinitializing Terraform for Apply"
          ENV_PATH="./environments"
          cd $ENV_PATH || exit 1
          terraform init -upgrade || { echo "Terraform init failed"; exit 1; }

      - name: Apply Terraform Changes
        run: |
          echo "## Applying Terraform Changes"
          ENV_PATH="./environments"
          cd $ENV_PATH || exit 1
          terraform apply -auto-approve tfplan || { echo "Terraform apply failed"; exit 1; }
