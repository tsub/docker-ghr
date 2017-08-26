# docker-ghr

Docker image for [ghr] :whale:

## Usage

```
$ docker pull tsub/ghr

# Set GitHub token
$ export GITHUB_TOKEN="...."

# Upload multiple artifacts to GitHub release
$ docker run -v $PWD:/work -w /work -e GITHUB_TOKEN=$GITHUB_TOKEN ghr --username user --repository repo v1.0.0 pkg/
```

## Install with [Whalebrew]

```
$ whalebrew install tsub/ghr

# Set GitHub token
$ export GITHUB_TOKEN="..." # or $ git config --global github.token "..."

# Upload multiple artifacts to GitHub release
$ ghr v1.0.0 pkg/
```

[ghr]: https://github.com/tcnksm/ghr
[Whalebrew]: https://github.com/bfirsh/whalebrew
