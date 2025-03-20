resource "aws_wafv2_web_acl" "waf" {
  name        = var.waf_name
  description = "WAF for ALB with AWS managed rules"
  scope       = "REGIONAL"   # Use "REGIONAL" for ALB, "CLOUDFRONT" for CloudFront
  default_action {
    allow {}
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "${var.waf_name}-waf-metrics"
    sampled_requests_enabled   = true
  }
  
# 1. Bot Control Rule 
rule {
  name            = "AWS-AWSManagedRulesBotControlRuleSet"
  priority        = 0

  override_action {
    none {}
  }

  statement {
    managed_rule_group_statement {
      name        = "AWSManagedRulesBotControlRuleSet"
      vendor_name = "AWS"

      managed_rule_group_configs {
        aws_managed_rules_bot_control_rule_set {
          inspection_level = "COMMON"
        }
      }

      rule_action_override {
        name          = "CategoryAdvertising"
        action_to_use {
          block {}
        }
      }
      rule_action_override {
        name          = "CategoryArchiver"
        action_to_use {
          block {}
        }
      }
      rule_action_override {
        name          = "CategoryContentFetcher"
        action_to_use {
          block {}
        }
      }
      rule_action_override {
        name          = "CategoryEmailClient"
        action_to_use {
          block {}
        }
      }
      rule_action_override {
        name          = "CategoryHttpLibrary"
        action_to_use {
          block {}
        }
      }
      rule_action_override {
        name          = "CategoryLinkChecker"
        action_to_use {
          block {}
        }
      }
      rule_action_override {
        name          = "CategoryMiscellaneous"
        action_to_use {
          block {}
        }
      }
      rule_action_override {
        name          = "CategoryMonitoring"
        action_to_use {
          block {}
        }
      }
      rule_action_override {
        name          = "CategoryScrapingFramework"
        action_to_use {
          block {}
        }
      }
      rule_action_override {
        name          = "CategorySearchEngine"
        action_to_use {
          block {}
        }
      }
      rule_action_override {
        name          = "CategorySecurity"
        action_to_use {
          block {}
        }
      }
      rule_action_override {
        name          = "CategorySeo"
        action_to_use {
          block {}
        }
      }
      rule_action_override {
        name          = "CategorySocialMedia"
        action_to_use {
          block {}
        }
      }
      rule_action_override {
        name          = "CategoryAI"
        action_to_use {
          block {}
        }
      }
      rule_action_override {
        name          = "SignalAutomatedBrowser"
        action_to_use {
          block {}
        }
      }
      rule_action_override {
        name          = "SignalKnownBotDataCenter"
        action_to_use {
          block {}
        }
      }
      rule_action_override {
        name          = "SignalNonBrowserUserAgent"
        action_to_use {
          block {}
        }
      }
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "AWS-AWSManagedRulesBotControlRuleSet"
    sampled_requests_enabled   = true
  }
}

  # 2. Admin Protection Rule
  rule {
    name     = "AWS-AWSManagedRulesAdminProtectionRuleSet"
    priority = 1

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesAdminProtectionRuleSet"
        vendor_name = "AWS"
      }
    }

    override_action {
      none {}
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWS-AWSManagedRulesAdminProtectionRuleSet"
      sampled_requests_enabled   = true
    }
  }

  # 3. Amazon IP Reputation List
  rule {
    name     = "AWS-AWSManagedRulesAmazonIpReputationList"
    priority = 2

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesAmazonIpReputationList"
        vendor_name = "AWS"
      }
    }

    override_action {
      none {}
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWS-AWSManagedRulesAmazonIpReputationList"
      sampled_requests_enabled   = true
    }
  }

  # 4. Anonymous IP List
  rule {
    name     = "AWS-AWSManagedRulesAnonymousIpList"
    priority = 3

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesAnonymousIpList"
        vendor_name = "AWS"
      }
    }

    override_action {
      none {}
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWS-AWSManagedRulesAnonymousIpList"
      sampled_requests_enabled   = true
    }
  }

  # 5. Core Rule Set
  rule {
    name     = "AWS-AWSManagedRulesCommonRuleSet"
    priority = 4

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
      }
    }

    override_action {
      none {}
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWS-AWSManagedRulesCommonRuleSet"
      sampled_requests_enabled   = true
    }
  }

  # 6. SQL Injection Rule
  rule {
    name     = "AWS-AWSManagedRulesSQLiRuleSet"
    priority = 5

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesSQLiRuleSet"
        vendor_name = "AWS"
      }
    }

    override_action {
      none {}
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWS-AWSManagedRulesSQLiRuleSet"
      sampled_requests_enabled   = true
    }
  }

  # 7. Windows OS Rule
  rule {
    name     = "AWS-AWSManagedRulesWindowsRuleSet"
    priority = 6

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesWindowsRuleSet"
        vendor_name = "AWS"
      }
    }

    override_action {
      none {}
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWS-AWSManagedRulesWindowsRuleSet"
      sampled_requests_enabled   = true
    }
  }
}

# Associate WAF with ALB
resource "aws_wafv2_web_acl_association" "associate_waf_to_alb" {
  resource_arn = aws_lb.alb.arn
  web_acl_arn  = aws_wafv2_web_acl.waf.arn
}
