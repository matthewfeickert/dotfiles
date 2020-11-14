from pathlib import Path as Path
import subprocess


def apt_get_install():
    tools_deb = ["vim", "bat", "visidata", "ripgrep"]
    subprocess.run(["sudo", "apt-get", "update", "-y", "-qq"], check=True)
    for tool in tools_deb:
        subprocess.run(["sudo", "apt-get", "install", "-y", tool], check=True)


def main():
    local_bin = Path.home() / "bin"
    local_bin.mkdir(exist_ok=True)

    apt_get_install()


if __name__ == "__main__":
    main()
