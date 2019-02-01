path "secret/data/*" {
capabilities = ["list"]
}
# to only list secrets
path "secret/*" {
capabilities = ["list"]
}
# to read secret
path "secret/data/galaxy/raone/yondu" {
capabilities = ["read"]
}
path "secret/data/galaxy/raone/key" {
capabilities = ["read"]
}
path "secret/data/galaxy/raone/key1" {
capabilities = ["read"]
}