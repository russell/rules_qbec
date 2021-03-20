<!-- Generated with Stardoc: http://skydoc.bazel.build -->

<a name="#qbec_show"></a>

## qbec_show

<pre>
qbec_show(<a href="#qbec_show-name">name</a>, <a href="#qbec_show-config">config</a>, <a href="#qbec_show-data">data</a>, <a href="#qbec_show-environment">environment</a>, <a href="#qbec_show-qbec">qbec</a>, <a href="#qbec_show-secrets">secrets</a>)
</pre>


Generate the QBEC project and show it


**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :-------------: | :-------------: | :-------------: | :-------------: | :-------------: |
| name |  A unique name for this target.   | <a href="https://bazel.build/docs/build-ref.html#name">Name</a> | required |  |
| config |  The config file for QBec   | <a href="https://bazel.build/docs/build-ref.html#labels">Label</a> | required |  |
| data |  The QBEC application project   | <a href="https://bazel.build/docs/build-ref.html#labels">List of labels</a> | required |  |
| environment |  The QBEC application project   | String | required |  |
| qbec |  -   | <a href="https://bazel.build/docs/build-ref.html#labels">Label</a> | optional | //qbec:qbec_tool |
| secrets |  -   | Boolean | optional | False |


