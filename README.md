# bazel-scala-test

Repo to validate issues with test-dependencies using: https://github.com/bazelbuild/rules_scala

At this point in time the repo is working fine:

* Building a `scala_library`
* Using `scala_library` as a dependency to `scala_test`
* Running under Bazel `4.0.0`

This repo is for validating the effect of gotest's flag on scala test.