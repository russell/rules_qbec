load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

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

    _maybe(
        http_archive,
        name = "bazel_skylib",
        sha256 = "7363ae6721c1648017e23a200013510c9e71ca69f398d52886ee6af7f26af436",
        strip_prefix = "bazel-skylib-c00ef493869e2966d47508e8625aae723a4a3054",
        url = "https://github.com/bazelbuild/bazel-skylib/archive/c00ef493869e2966d47508e8625aae723a4a3054.tar.gz",  # 2018-12-06
    )

def _maybe(repo_rule, name, **kwargs):
    if name not in native.existing_rules():
        repo_rule(name = name, **kwargs)
