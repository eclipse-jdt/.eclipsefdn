local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-jdt') {
  settings+: {
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "",
    members_can_fork_private_repositories: true,
    name: "Eclipse JDT",
    readers_can_create_discussions: true,
    security_managers+: [
      "eclipse-jdt-committers"
    ],
    two_factor_requirement: false,
    web_commit_signoff_required: false,
    workflows+: {
      default_workflow_permissions: "write",
    },
  },
  webhooks+: [
    orgs.newOrgWebhook('https://ci.eclipse.org/jdt/github-webhook/') {
      content_type: "json",
      events+: [
        "pull_request",
        "push"
      ],
    },
  ],
  _repositories+:: [
    orgs.newRepo('.github') {
      allow_merge_commit: false,
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('eclipse.jdt') {
      default_branch: "master",
      delete_branch_on_merge: false,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('R*maintenance') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('eclipse.jdt.core') {
      default_branch: "master",
      delete_branch_on_merge: false,
      has_discussions: true,
      has_projects: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('R*maintenance') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('eclipse.jdt.core.binaries') {
      default_branch: "master",
      delete_branch_on_merge: false,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('R*maintenance') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('eclipse.jdt.debug') {
      default_branch: "master",
      delete_branch_on_merge: false,
      has_discussions: true,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('R*maintenance') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('eclipse.jdt.ui') {
      default_branch: "master",
      delete_branch_on_merge: false,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('R*maintenance') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('jdt-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
  ],
}
