return {
    cmd = { "pylsp" },
    filetypes = { "python" },
    root_markers = {
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        "Pipfile",
        ".git",
    },
    settings = {
        pylsp = {
            plugins = {
                black = { enabled = true },
                autopep8 = { enabled = false },
                yapf = { enabled = false },
            }
        }
    }
}
