"""
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def _qbec_show_impl(ctx):
    input_files = ctx.files.data
    out_file = ctx.actions.declare_file("%s.yaml" % ctx.attr.name)

    command = (
        [ctx.executable.qbec.path] +
        ["show", ctx.attr.environment] +
        ["-S" if ctx.attr.secrets else ""] +
        [">", "%s" % out_file.path]
    )

    ctx.actions.run_shell(
        inputs = input_files,
        outputs = [out_file],
        tools = [ctx.executable.qbec],
        progress_message = "Generating %s" % ctx.attr.environment,
        command = " ".join(command),
    )

    return [DefaultInfo(files = depset([out_file]))]

qbec_show = rule(
    implementation = _qbec_show_impl,

    attrs = {
        "environment": attr.string(
            mandatory = True,
            doc = "The QBEC application project",
        ),
        "data": attr.label_list(
            mandatory = True,
            allow_files = True,
            doc = "The QBEC application project",
        ),
        "secrets": attr.bool(
            default = False,
            mandatory = False,
        ),
        "qbec": attr.label(
            default = Label("//qbec:qbec_tool"),
            cfg = "host",
            executable = True,
            allow_single_file = True,
        ),
    },
    doc = """
Generate the QBEC project and show it
""",
)

def qbec_repositories():
    http_archive(
        name = "qbec",
        sha256 = "9a891dc8cf93a3e144c02c4a4cb6e2e0fb733a87e230da0b1cdc1f33956eff75",
        urls = ["https://github.com/splunk/qbec/releases/download/v0.14.1/qbec-linux-amd64.tar.gz"],
        build_file = "@rule_qbec//qbec:qbec.BUILD",
    )

    http_archive(
        name = "qbec_osx",
        sha256 = "0221f15360bcafa3e56979438a372d9b11383931a6a480b553b69c3222858da1",
        urls = ["https://github.com/splunk/qbec/releases/download/v0.14.1/qbec-darwin-amd64.tar.gz"],
        build_file = "@rule_qbec//qbec:qbec.BUILD",
    )
