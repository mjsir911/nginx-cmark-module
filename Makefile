# CFLAGS=-Inginx/src/http/ -Inginx/src/core -Inginx/objs/ -Inginx/src/os/unix/ -Inginx/src/event -Inginx/src/http/modules/
# 
# %.so: %.o
# 	$(CC) -shared -o $@ $^

ngx_http_cmark_module.so: nginx/objs/ngx_http_cmark_module.so
	cp $< $@

nginx/objs/ngx_http_cmark_module.so: nginx/objs/Makefile
	$(MAKE) -C nginx -f objs/Makefile objs/ngx_http_cmark_module.so

clean:
	-$(MAKE) -C nginx clean
	$(RM) ngx_http_cmark_module.so ngx_http_cmark_module.o

nginx/objs/Makefile: nginx/auto/configure
	cd nginx && ./auto/configure --add-dynamic-module=../

