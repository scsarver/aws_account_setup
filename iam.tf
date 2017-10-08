resource "aws_iam_user" "user_admin" {
  name = "${var.iam_prefix}-admin"
  path = "/"
}

resource "aws_iam_group" "group_admin" {
  name = "${var.iam_prefix}-admin-group"
}

resource "aws_iam_group_membership" "group_membership_admin" {
  name = "${var.iam_prefix}-admin"

  users = [
    "${aws_iam_user.user_admin.name}",
  ]

  group = "${aws_iam_group.group_admin.name}"
}

resource "aws_iam_group_policy_attachment" "policy_attachment_admin" {
  group      = "${aws_iam_group.group_admin.name}"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_user" "user_poweruser" {
  name = "${var.iam_prefix}-poweruser"
  path = "/"
}

resource "aws_iam_group" "group_poweruser" {
  name = "${var.iam_prefix}-poweruser-group"
}

resource "aws_iam_group_membership" "group_membership_poweruser" {
  name = "${var.iam_prefix}-poweruser"

  users = [
    "${aws_iam_user.user_poweruser.name}",
  ]

  group = "${aws_iam_group.group_poweruser.name}"
}

resource "aws_iam_group_policy_attachment" "policy_attachment_poweruser" {
   group      = "${aws_iam_group.group_poweruser.name}"
   policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}

resource "aws_iam_user" "user_readonly" {
  name = "${var.iam_prefix}-readonly"
  path = "/"
}

resource "aws_iam_group" "group_readonly" {
  name = "${var.iam_prefix}-readonly-group"
}

resource "aws_iam_group_membership" "group_membership_readonly" {
  name = "${var.iam_prefix}-readonly"

  users = [
    "${aws_iam_user.user_readonly.name}",
  ]

  group = "${aws_iam_group.group_readonly.name}"
}

resource "aws_iam_group_policy_attachment" "policy_attachment_readonly" {
  group      = "${aws_iam_group.group_readonly.name}"
    policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}
