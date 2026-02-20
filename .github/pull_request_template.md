**Related issues**

<!-- Add links to related issues here. If you want an issue to be automatically closed when the PR is merged, use keywords (https://docs.github.com/en/issues/tracking-your-work-with-issues/linking-a-pull-request-to-an-issue#linking-a-pull-request-to-an-issue-using-a-keyword) -->

**Description**

<!-- If the changes in the PR are not sufficiently explained by the related issues and commit messages, add a description here -->

**Merge checklist**

<!-- Complete the checklist before requesting a review. -->

- [ ] Update the changelog

If you have edited any schema files:

- [ ] Run `hsds_schema.py` to update `datapackage.json` and example files

If you are working towards a new MINOR release:

- [ ] Update any `$id` values in schema files where appropriate
- [ ] Update the `$ref` values in `openapi.json`
