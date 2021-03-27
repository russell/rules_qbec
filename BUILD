load("@com_github_bazelbuild_buildtools//buildifier:def.bzl", "buildifier")
load("@io_bazel_stardoc//stardoc:stardoc.bzl", "stardoc")
load("@com_github_russell_rules_stately//stately:defs.bzl", "project_installed_files")
load("//qbec:defs.bzl", "qbec_show")

buildifier(
    name = "buildifier",
)

stardoc(
    name = "qbec_doc",
    input = "//qbec:defs.bzl",
    out = "README.md",
    symbol_names = ["qbec_show"],
    deps = ["//qbec:qbec_lib"],
)

project_installed_files(
    name="deploy_qbec_doc",
    srcs = [":qbec_doc"],
    output = "qbec"
)
