load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def qbec_repositories():
    http_archive(
        name = "qbec_linux",
        sha256 = "9a891dc8cf93a3e144c02c4a4cb6e2e0fb733a87e230da0b1cdc1f33956eff75",
        urls = ["https://github.com/splunk/qbec/releases/download/v0.14.1/qbec-linux-amd64.tar.gz"],
        build_file = "@com_github_russell_rules_qbec//qbec:qbec.BUILD",
    )

    http_archive(
        name = "qbec_osx",
        sha256 = "0221f15360bcafa3e56979438a372d9b11383931a6a480b553b69c3222858da1",
        urls = ["https://github.com/splunk/qbec/releases/download/v0.14.1/qbec-darwin-amd64.tar.gz"],
        build_file = "@com_github_russell_rules_qbec//qbec:qbec.BUILD",
    )

    maybe(
        http_archive,
        name = "bazel_skylib",
        urls = [
            "https://github.com/bazelbuild/bazel-skylib/releases/download/1.0.3/bazel-skylib-1.0.3.tar.gz",
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.0.3/bazel-skylib-1.0.3.tar.gz",
        ],
        sha256 = "1c531376ac7e5a180e0237938a2536de0c54d93f5c278634818e0efc952dd56c",
    )
