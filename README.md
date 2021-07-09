# bazel-scala-test

Repo to validate issues with test-dependencies using: https://github.com/bazelbuild/rules_scala

At this point in time the repo is working fine:

* Building a `scala_library`
* Using `scala_library` as a dependency to `scala_test`
* Running under Bazel `4.0.0`

This repo is for validating the effect of gotest's flag on scala test.
The following command will fail

```bash
bazel test //...
```


# Demo of the rule_jvm_external transitive dependency problem

It pops the following problem when run `bazel build //...`

```
A full rebuild may help if 'Encoder.class' was compiled against an incompatible version of cats.
  Greeting("Hey", Person("Chris"), 3).asJson
          ^
src/main/scala/CirceSample/CirceSample.scala:10: error: could not find implicit value for parameter encoder: io.circe.Encoder[CirceSample.CirceSample.Greeting]
  Greeting("Hey", Person("Chris"), 3).asJson

```


