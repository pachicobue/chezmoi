## Arch@WSL の環境構築

### Distributionの追加

[ArchWSL](https://github.com/yuk7/ArchWSL) が超ラク。
[setup](https://wsldl-pg.github.io/ArchW-docs/How-to-Setup/) までやる。

### chezmoi実行まで

- 必要パッケージのインストール

```sh
$ sudo pacman -S {好きなエディタ}
$ sudo pacman -S git chezmoi ghq github-cli openssh
```

- github-cliのセットアップ（SSHベースしか試したことがない）


```sh
$ gh auth login
```

### chezmoi実行

```sh
$ ghq get git@github.com:pachicobue/chezmoi.git
$ chezmoi init -S ~/ghq/github.com/pachicobue/chezmoi
$ chezmoi doctor
$ chezmoi apply -v
```

## ネイティブArchの環境構築

未確立！
