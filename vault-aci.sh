RG="rg-booth-bucket"
VAULT_IMAGE="dankydoo/vault-test"
SA_NAME="boothbucket"
FILE_SHARE="vault-data"

SA_KEY=$(az storage account keys list -g ${RG} -n ${SA_NAME} --query "[0].value" -o tsv)

az container create \
--name "vault-test" \
--resource-group $RG \
--image $VAULT_IMAGE \
--dns-name-label 'vault-test' \
--ports 8200 \
--azure-file-volume-account-name $SA_NAME \
--azure-file-volume-account-key $SA_KEY \
--azure-file-volume-share-name $FILE_SHARE \
--azure-file-volume-mount-path "/opt/vault/data"
