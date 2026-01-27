"""Provides the repository macro to import rmm."""

load("//third_party:repo.bzl", "tf_http_archive", "tf_mirror_urls")

def repo():
    """Imports rmm."""

    RMM_COMMIT = "74928283277dad2df5ddc58df8ff68c1809a1342" # release/26.02
    RMM_SHA256 = "3e45d74bc0117b95f8475996cc048afe287e230d078255d1fb199a4f9068e99f"

    tf_http_archive(
        name = "rmm",
        sha256 = RMM_SHA256,
        strip_prefix = "rmm-{commit}".format(commit = RMM_COMMIT),
        urls = tf_mirror_urls("https://github.com/rapidsai/rmm/archive/{commit}.tar.gz".format(commit = RMM_COMMIT)),
        build_file = "//third_party/rmm:rmm.BUILD",
        patch_file = ["//third_party/rmm:logger_macros.hpp.patch"],
    )
