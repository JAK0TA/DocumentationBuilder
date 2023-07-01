# Documentation Builder

Build documentation with Sphinx from inside your PHP code.

## Prerequisites

- [Composer v2](https://getcomposer.org/download/)
- [Docker](https://www.docker.com/products/container-runtime)

## Detailed Usage

- Add as require-dev `composer require --dev jakota/documentation-builder`
- Create documentation folder like Documentation in the project root
- Add documentation blocks to your php files.

```text
<?php

/** Documentation:Start:TocTree:Test/Index.rst.
 *
 *Welcome to Your documentation!
 *=======================================
 *
 *.. toctree::
 *   :maxdepth: 2
 *   :caption: Contents:
 *
 *
 *Documentation:End
 */
class DemoController {
```

Every line between 

```text
/** Documentation:Start:TocTree:Demo/Index.rst.
```

and

```text
 *Documentation:End
 */
```

will be coped without the leading ` *` into the the file `Demo/Index.rst`.  
And if `TocTree:` is set, this file will also be added to the TocTree in the root `Index.rst`.

You can add multiple blocks to one file.  
But it is important that the indent of every line in one block stays the same.
