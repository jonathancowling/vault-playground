# Dynamic Secrets Demo

This demo shows how credentials can be automatically generated by vault and provided to users with authorization.

> The documentation (seems to) provide a recommendation against having root database credentials stored in vault.
> Application level credentials are to be generated by vault, but the root (and vault's) credentials
> should be stored externally (usually within a cloud providers secret management tool).