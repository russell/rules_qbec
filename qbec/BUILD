load("@bazel_skylib//:bzl_library.bzl", "bzl_library")

package(default_visibility = ["//visibility:public"])

exports_files(["defs.bzl"])

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

bzl_library(
    name = "qbec_lib",
    srcs = ["defs.bzl"],
    deps = [
        "@bazel_skylib//lib:shell.bzl",
        "@bazel_skylib//lib:paths.bzl",
    ],
)
