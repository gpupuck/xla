"""Provides the repository macro to import raft."""

load("//third_party:repo.bzl", "tf_http_archive", "tf_mirror_urls")

def repo():
    """Imports raft."""

    RAFT_COMMIT = "ce7538f1a852c18a748a9170c6793bc9709dd1fd" # release/26.02
    RAFT_SHA256 = "2fa00623abf4f914d53541a17e376b8f30d95812396ed24e51b5f0bba691c066"

    tf_http_archive(
        name = "raft",
        sha256 = RAFT_SHA256,
        strip_prefix = "raft-{commit}".format(commit = RAFT_COMMIT),
        urls = tf_mirror_urls("https://github.com/rapidsai/raft/archive/{commit}.tar.gz".format(commit = RAFT_COMMIT)),
        build_file = "//third_party/raft:raft.BUILD",
        patch_file = [
            "//third_party/raft:clang_cuda_intrinsics.h.patch",
            "//third_party/raft:logger_macros.hpp.patch",
            "//third_party/raft:select_k_runner.hpp.patch",
            "//third_party/raft:select_k_runner.cu.cc.patch",
            "//third_party/raft:select_k_smoke_test.cu.cc.patch",
        ],
    )
