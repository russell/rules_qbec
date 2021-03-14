package(default_visibility = ["//visibility:public"])

exports_files(["qbec.bzl"])

exports_files(
    ["runner.bash.template"],
    visibility = ["//visibility:public"],
)

alias(
    name = "qbec_tool",
    actual = select({
        "@bazel_tools//src/conditions:linux_x86_64": "@qbec_linux//:qbec",
        "@bazel_tools//src/conditions:darwin": "@qbec_osx//:qbec",
    }),
)
