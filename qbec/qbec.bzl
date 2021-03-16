"""
"""

load("@bazel_skylib//lib:shell.bzl", "shell")
load("@bazel_skylib//lib:paths.bzl", "paths")

def _qbec_show_impl(ctx):
    input_files = ctx.files.data
    out_file = ctx.actions.declare_file("%s.yaml" % ctx.attr.name)

    args = [
        a for a in
        ["show", ctx.attr.environment] +
        ["-S" if ctx.attr.secrets else ""]
        if a != ""
    ]

    runner_out_file = ctx.actions.declare_file(ctx.label.name + ".bash")
    substitutions = {
        "@@ARGS@@": shell.array_literal(args),
        "@@QBEC_SHORT_PATH@@": shell.quote(ctx.executable.qbec.short_path),
        "@@OUT_FILE@@": out_file.short_path,
    }
    ctx.actions.expand_template(
        template = ctx.file._runner,
        output = runner_out_file,
        substitutions = substitutions,
        is_executable = True,
    )

    ctx.actions.run_shell(
        inputs = input_files,
        outputs = [out_file],
        tools = [ctx.executable.qbec],
        progress_message = "Generating %s" % ctx.attr.environment,
        command = " ".join([ctx.executable.qbec.path] + args + [">", "'%s'" % out_file.path]),
    )

    return [
        DefaultInfo(
            files = depset([out_file]),
            runfiles = ctx.runfiles(files = [ctx.executable.qbec]),
            executable = runner_out_file,
        ),
    ]

qbec_show = rule(
    implementation = _qbec_show_impl,
    executable = True,
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
        "_runner": attr.label(
            default = "//qbec:runner.bash.template",
            allow_single_file = True,
        ),
    },
    doc = """
Generate the QBEC project and show it
""",
)
