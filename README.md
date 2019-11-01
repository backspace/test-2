```
# .travis.yml
import:
 - all.yml
 - pretest.yml
 - posttest.yml
 - coverage.yml

# all.yml@master
import:
- minors/all.yml
- 0.x/all.yml

# minors/all.yml@master
import:
- minors/gte_4.yml
- minors/iojs.yml

# pretest.yml@master
script:
  - 'pre'
matrix:
  include:
    - node_js: "pre"

# posttest.yml@master
script:
  - 'post'
matrix:
  include:
    - node_js: "post"

# coverage.yml@master
script:
  - 'coverage'
matrix:
  include:
    - node_js: "coverage"

# 0.x/all.yml@master
node_js:
  - '0.x.0 (node_js)'
  - '0.x.1 (node_js)'
script:
  - 'all'
env:
  - TEST=true
matrix:
  include:
    - node_js: '0.x.2 (matrix.include)'
    - node_js: '0.x.3 (matrix.include)'

# minors/gte_4.yml@master
node_js:
  - 'gte_4.0 (node_js)'
  - 'gte_4.1 (node_js)'
script:
  - 'gte_4'
matrix:
  include:
    - node_js: 'get_4.2 (matrix.include)'
    - node_js: 'get_4.3 (matrix.include)'

# minors/iojs.yml@master
node_js:
  - 'iojs_1 (node_js)'
  - 'iojs_2 (node_js)'
script:
  - 'iojs'
matrix:
  include:
    - node_js: "iojs_3 (matrix.include)"
    - node_js: "iojs_4 (matrix.include)"
```
