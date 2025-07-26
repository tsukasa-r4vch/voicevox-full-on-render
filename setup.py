from setuptools import setup, find_packages

setup(
    name="voicevox_engine",
    version="0.1.0",
    packages=find_packages(include=["voicevox_engine", "voicevox_engine.*"]),
    include_package_data=True,
    install_requires=[],
)
