""" Provides the CCCL headers for CUDA. """

# CCCL version 2.8.5
# https://github.com/NVIDIA/cccl/releases/tag/v2.8.5
_CCCL_GITHUB_ARCHIVE = {
    "full_path": "https://github.com/NVIDIA/cccl/archive/refs/tags/v3.2.0.tar.gz",
    "sha256": "5e69383b2f3355291c7ca66625448d87686360c84c347a37ad439bb48fbea8e8",
    "strip_prefix": "v3.2.0",
}

CCCL_DIST_DICT = {
    "cuda_cccl": {
        "linux-x86_64": _CCCL_GITHUB_ARCHIVE,
        "linux-sbsa": _CCCL_GITHUB_ARCHIVE,
    },
}

CCCL_GITHUB_VERSIONS_TO_BUILD_TEMPLATES = {
    "cuda_cccl": {
        "repo_name": "cuda_cccl",
        "version_to_template": {
            "any": "@rules_ml_toolchain//gpu/cuda/build_templates:cuda_cccl_github.BUILD.tpl",
        },
        "local": {
            "source_dirs": ["include", "lib"],
            "version_to_template": {
                "any": "@rules_ml_toolchain//gpu/cuda/build_templates:cuda_cccl.BUILD.tpl",
            },
        },
    },
}
