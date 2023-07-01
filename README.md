# Documentation Builder

Build documentation with Sphinx from inside your PHP code.

## Prerequisites

- [Composer v2](https://getcomposer.org/download/)
- [Docker](https://www.docker.com/products/container-runtime)

## Detailed Usage

### Add as require-dev

```bash
composer require --dev jakota/documentation-builder
```

### Create documentation folder like Documentation in the project root

```bash
mkdir ./Documentation
```

### Add documentation blocks aka DocBlocks to your php files

The project needs a Index.rst to start from.  

Add the following comment to a file.  
Usually the main class or a file in the start folder.  
It doesn't matter where this comment is located but it must not be found more than once.  

```php
<?php
/** Documentation:Start:Index.rst.
 *
 *Welcome to Your documentation index!
 *====================================
 *
 *.. toctree::
 *   :maxdepth: 2
 *   :caption: Contents:
 *
 *TocTreeInsert
 *
 *Documentation:End
 */
```

You can edit the text to your liking but don't remove the TocTreeInsert placeholder.  

Next you want to add more DocBlocks to your PHP code.

```php
<?php

/** Documentation:Start:TocTree:Demo/Index.rst.
 *
 *Demo Class with cool new features
 *=================================
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

will be coped without the leading `*` into the file `Demo/Index.rst`.  
And if `TocTree:` is set, this file will also be added to the TocTree in the main `Index.rst`.

You can add multiple DocBlocks wherever you want  to one file.  
But it is important that the indent of every line stays the same per DocBlock.

### Run the build script from your project root

```bash
./vendor/bin/documentation-builder {source-folder} {documentation-folder}
```

For example:  

```bash
./vendor/bin/documentation-builder ./Classes ./Documentation
```

## Happy documenting :)
