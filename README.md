# bazel-scala-test

Repo to validate issues with test-dependencies using: https://github.com/bazelbuild/rules_scala

At this point in time the repo is working fine:

* Building a `scala_library`
* Using `scala_library` as a dependency to `scala_test`
* Running under Bazel `0.5.4`, `0.6.0`, and `0.6.1`
