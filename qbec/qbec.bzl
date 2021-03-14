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
