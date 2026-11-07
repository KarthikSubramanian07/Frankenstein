def pytest_configure(config):
    config.addinivalue_line("markers", "live: calls a real external API; runs only with LIVE=1")
