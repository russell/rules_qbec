package(default_visibility = ["//visibility:public"])

exports_files(["qbec.bzl"])

alias(
    name = "qbec_tool",
    actual = select({
        "@bazel_tools//src/conditions:linux_x86_64": "@qbec//:qbec",
        "@bazel_tools//src/conditions:darwin": "@qbec_osx//:qbec",
    }),
)
