#include <linux/module.h>
#include <linux/kernel.h>

static int __init dumb_init_module(void)
{
	printk( KERN_DEBUG "Hello world!\n" );
	return 0;
}

static void __exit dumb_cleanup_module(void)
{
	printk( KERN_DEBUG "Goodbye world!\n" );
}

module_init(dumb_init_module);
module_exit(dumb_cleanup_module);
