sh_binary(
    name = "qbec",
    srcs = ["qbec.sh"],
    data = select({
        "@bazel_tools//src/conditions:linux_x86_64": ["@qbec//:allfiles"],
        "@bazel_tools//src/conditions:darwin": ["@qbec_osx//:allfiles"],
    }),
    visibility = ["//visibility:public"],
    deps = ["@bazel_tools//tools/bash/runfiles"],
)

sh_test(
    name = "dummy_test",
    size = "small",
    srcs = [
        ".dummy_test.sh",
    ],
)
