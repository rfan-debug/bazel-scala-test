load("@rules_jvm_external//:defs.bzl", "maven_install")
load("@rules_jvm_external//:specs.bzl", "maven")

SCALA_VERSION_MAJOR = "2.12"
SCALA_VERSION_MINOR = "2.12.13"

def _scala_dep(group, artifact, version):
    """Create a scala artifact coordinate string, including the scala version in the artifact version identifier."""
    return "%s:%s_%s:%s" % (group, artifact, SCALA_VERSION_MAJOR, version)

IO_CIRCE = "0.13.0"

def jvm_deps():
    maven_install(
        name = "jvm_deps",
        artifacts = [
            "junit:junit:4.12",
            _scala_dep("io.circe", "circe-core", IO_CIRCE),
            _scala_dep("io.circe", "circe-parser", IO_CIRCE),
            _scala_dep("io.circe", "circe-derivation", IO_CIRCE + "-M5"),
            _scala_dep("io.circe", "circe-generic", IO_CIRCE),
            _scala_dep("io.circe", "circe-generic-extras", IO_CIRCE),
            _scala_dep("io.circe", "circe-jawn", IO_CIRCE),
            "org.scala-lang:scala-compiler:" + SCALA_VERSION_MINOR,
            "org.scala-lang:scala-library:" + SCALA_VERSION_MINOR,
            "org.scala-lang:scala-reflect:" + SCALA_VERSION_MINOR,
        ],
        repositories = [
            # Private repositories are supported through HTTP Basic auth
            "https://repo.maven.apache.org/maven2/",
            "https://jcenter.bintray.com/",
        ],
        fetch_sources = True,  # download the source JAR alongside the main artifact JAR
        maven_install_json = "@hello//:jvm_deps_install.json",
        strict_visibility = True,
        use_unsafe_shared_cache = True,
    )