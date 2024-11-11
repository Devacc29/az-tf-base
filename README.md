Base module will create a Resource group and a storage account.

Create service principal and assign roles to it at subscription level in portal.

Contributor
User Access Administrator

create secrets in the repo and add the below details based on the service principal details.

    ARM_CLIENT_ID: ${{ secrets.ARM_CLIENT_ID }}
    ARM_CLIENT_SECRET: ${{ secrets.ARM_CLIENT_SECRET }}
    ARM_TENANT_ID: ${{ secrets.ARM_TENANT_ID }}
    ARM_SUBSCRIPTION_ID: ${{ secrets.ARM_SUBSCRIPTION_ID }}